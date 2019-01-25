require "./web_crawler"
require "rspec"

RSpec.describe WebCrawler do
  it "can scrape triplebyte" do
    crawler = WebCrawler.new(10, VerboseCrawlerLogger)
    prefix = "http://triplebyte.github.io/web-crawler-test-site/already-passing-tests/";

    crawler.crawl(prefix, nil, false)
    expect(crawler.graph[prefix]).to_not be_nil
    expect(crawler.graph[prefix + "page2"]).to_not be_nil
    expect(crawler.graph[prefix + "page2-real"]).to_not be_nil
    expect(crawler.graph[prefix + "page2-fake"]).to_not be_nil
  end
end
