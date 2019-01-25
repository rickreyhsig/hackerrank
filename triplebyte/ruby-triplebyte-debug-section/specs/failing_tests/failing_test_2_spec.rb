require "./web_crawler"
require "rspec"

RSpec.describe WebCrawler do
  it "correctly finds a broken link" do
    crawler = WebCrawler.new(10, VerboseCrawlerLogger)
    crawler.crawl("triplebyte.github.io/web-crawler-test-site/test2/", nil, true)

    expect(crawler.graph["http://triplebyte.github.io/web-crawler-test-site/test2/page2.html"]).to_not be_nil
  end
end
