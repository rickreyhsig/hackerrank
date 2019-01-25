require "./src/crawl"

if __FILE__ == $0
  class CrawlerRunner
    include ArgParser::DSL

    purpose <<-EOT
      This is a multithreaded web scraper.

      Its main purpose is to test for the lack of broken links on a website.
      It does this slightly more cleverly than most other scrapers. It only
      does GET requests for pages which are plausibly web pages on your domain.
      Whenever there's a link to a resource which isn't a web page, or which is
      on a different domain, this scraper makes a HEAD request instead.
    EOT

    positional_arg :target, 'This is the website to scrape'
    keyword_arg :number_of_threads, 'This is the number of concurrent threads to use in the scraper',
        default: '10'

    keyword_arg :output_file, 'If specified, the result will be stored in this file', default: nil

    flag_arg :verbose, 'If turned on, the scraper will print out lots of stuff as it goes'

    def run
      if opts = parse_arguments
        crawler = WebCrawler.new(opts.number_of_threads.to_i, opts.verbose ? VerboseCrawlerLogger : SilentCrawlerLogger)
        crawler.crawl(opts.target, opts.output_file)
      else
        show_help? ? show_help : show_usage
      end
    end

  end

  CrawlerRunner.new.run
end
