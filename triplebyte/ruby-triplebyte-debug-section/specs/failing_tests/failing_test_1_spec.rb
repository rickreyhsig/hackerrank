require "./web_crawler"
require "rspec"

RSpec.describe WebCrawler do
  it "crawls SVG file with HEAD request" do
    crawler = WebCrawler.new(1, VerboseCrawlerLogger)
    crawler.crawl("triplebyte.github.io/web-crawler-test-site/test1/", nil, true)

    expect(crawler.graph["http://triplebyte.github.io/web-crawler-test-site/test1/SVG_logo.svg"].request_type).to eq(:head)
  end
end
