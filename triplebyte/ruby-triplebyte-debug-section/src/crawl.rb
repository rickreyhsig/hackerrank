require 'curl'
require 'set'
require 'arg-parser'
require 'psych'

# This file contains the logic for the multithreaded crawling. It controls
# all the threading, and the decisions to request pages with GET or HEAD.


# loggers.rb defines different Logger objects, which are used to control logging
# behaviors
require_relative 'loggers'

# html_helper.rb contains the logic for parsing HTML and getting useful URLs from it
require_relative 'html_helper'

# graph.rb contains the class which represents the website graph, with nodes and
# edges.
require_relative 'graph'


Thread.abort_on_exception = true

class WebCrawler
  include HtmlHelper
  attr_reader :errors, :parents, :page_values, :graph

  def initialize(max_threads, logger_class)
    @number_of_running_threads = 0
    @max_threads = max_threads
    @queue = []
    @currently_being_explored = Set.new
    @graph = WebsiteGraph.new
    @errors = []
    @logger = logger_class.new(self) || SilentCrawlerLogger.new(self)
  end

  def crawl(initial_url, output_file, display_results = true)
    if initial_url.index("http") != 0
      initial_url = "http://" + initial_url
    end

    @domain = URI(initial_url)
    @domain.path = "/" if @domain.path == "" || @domain.path.nil?

    @main_thread = Thread.current

    enqueue(initial_url)

    until @queue.empty? && @currently_being_explored.empty?
      sleep(5)
    end

    if display_results
      puts "\n\ndone!"

      if @errors.empty?
        puts "No errors found."
      else
        puts "Here are all the complaints found:"
        @errors.each { |e| puts e }
      end
    end

    if output_file
      File.write(output_file, Psych.dump(@graph))
    end

    p '--**--'
    p @graph

    @graph
  end

private
  def enqueue(url)
    return if @graph.nodes[url]
    @graph.add_node(url)
    @logger.enqueue(url)

    if @number_of_running_threads < @max_threads
      @number_of_running_threads += 1
      spawn_crawling_thread(url)
    else
      @queue << url
      @graph.add_node(url)
    end
  end

  def finalize_crawl(url)
    @logger.finalize_crawl(url)
    @currently_being_explored.delete(url)

    if @queue.length > 0
      url = @queue.pop
      spawn_crawling_thread(url)
    else
      @number_of_running_threads -= 1
    end

    @main_thread.wakeup
  end

  def spawn_crawling_thread(url)
    @logger.spawn_crawling_thread(url)
    @currently_being_explored.add(url)

    Thread.new do
      uri_object = URI(url)
      p 'VALID??'
      p uri_object

      if uri_should_be_crawled_as_node?(uri_object)
        crawl_with_get_request(url)
      else
        crawl_with_head_request(url)
      end
    end
  end

  def uri_should_be_crawled_as_node?(uri_object)
    return false unless uri_object.host == @domain.host

    # prevent you from starting to crawl FTP if you're looking at HTTP
    return false unless uri_object.scheme == @domain.scheme

    filetype = File.extname(uri_object.path)

    return false if %w(.pdf .jpg .gif .js .css .png .svg).include?(filetype)

    true
  end

  def crawl_with_get_request(url)
    @logger.crawl_with_get_request(url)
    begin
      response = Curl.get(url) do |http|
        http.follow_location = true
        http.timeout = 10
      end
    rescue => e
      note_error("When crawling #{url}, got this error: #{e} (linked from #{@graph.parents(url)})")

      node = @graph.nodes[url]
      node.status = :failure
      node.error = e
      node.request_type = :get
    else
      if response.body_str && response.content_type.split("/").first == "text"
        get_neighbors(response.body_str, response.last_effective_url).each do |neighbor_url|
          @graph.add_neighbor(url, neighbor_url)
          enqueue(neighbor_url.to_s)
        end
      end

      data = {request_type: :get, status: response.status.to_i}

      if response.status.to_i == 301
        data["headers"] = response.headers
      end

      node = @graph.nodes[url]
      node.status = :success
      node.request_type = :get
      node.status_code = response.status.to_i
      if node.status_code >= 400
        note_error("When crawling #{url}, got a #{node.status_code} (linked from #{@graph.parents(url)})")
      end
      node.contents = response.body_str
    end
    finalize_crawl(url)
  end

  def crawl_with_head_request(url)
    @logger.crawl_with_head_request(url)
    begin
      response = Curl::Easy.http_head(url) do |http|
        http.timeout = 10
      end
    rescue => e
      note_error("When crawling #{url}, got this error: #{e} (linked from #{@graph.parents(url)})")

      node = @graph.nodes[url]
      node.status = :failure
      node.error = e
      node.request_type = :head
    else
      node = @graph.nodes[url]
      node.status = :success
      node.request_type = :head
      node.status_code = response.status.to_i

      if node.status_code >= 400
        note_error("When crawling #{url}, got a #{node.status_code} (linked from #{@graph.parents(url)})")
      end
      finalize_crawl(url)
    end
  end

  def note_error(error)
    @errors << error
    @logger.note_error(error)
  end
end
