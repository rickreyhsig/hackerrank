# graph.rb contains the class which represents the website graph, with nodes and
# edges.

class WebsiteGraph
  attr_reader :nodes, :outgoing_links, :incoming_links

  def initialize
    @nodes = Hash.new
    @outgoing_links = Hash.new { |hash, key| hash[key.to_s] = [] }
    @incoming_links = Hash.new { |hash, key| hash[key.to_s] = [] }
  end

  def add_node(url)
    @nodes[url] = PageNode.new(url)
  end

  def [](url)
    @nodes[url.to_s]
  end

  def add_neighbor(from_url, to_url)
    @outgoing_links[from_url] << to_url
    @incoming_links[to_url] << from_url
  end

  def parents(url)
    @incoming_links[url]
  end

  class PageNode
    attr_accessor :status, :status_code, :contents, :error, :request_type, :url

    def initialize(url)
      @url = url
      @request_type = nil
      @status = nil
      @status_code = nil
      @contents = nil
      @error = nil
    end

    def inspect
      "PageNode<#{url} #{status}, #{status_code}, #{request_type}>"
    end
  end
end
