require "./web_crawler"
require "rspec"

RSpec.describe WebCrawler do
  it "successfully crawls another weird page" do
    crawler = WebCrawler.new(10, VerboseCrawlerLogger)
    crawler.crawl("http://triplebyte.github.io/web-crawler-test-site/test4/", nil, true)

    expect(crawler.graph.nodes.keys.any? { |key| key.include?("page3") }).to be(true)
  end
end
