require "./web_crawler"
require "rspec"

RSpec.describe WebCrawler do
  it "does not hang when crawling a weird page" do

    # The bug here is that the crawler will hang. Don't sit around waiting
    # for it to finish!
    crawler = WebCrawler.new(10, VerboseCrawlerLogger)
    crawler.crawl("http://triplebyte.github.io/web-crawler-test-site/test3/", nil, true)

    expect(crawler.graph.nodes.keys.any? { |key| key.include?("blah.com:7091") }).to be(true)
  end
end
