# loggers.rb defines different Logger objects, which are used to control logging
# behaviors

class SilentCrawlerLogger
  def initialize(crawler)
    @crawler = crawler
  end

  def enqueue(url)
  end

  def finalize_crawl(url)
  end

  def spawn_crawling_thread(url)
  end

  def crawl_with_head_request(url)
  end

  def crawl_with_get_request(url)
  end

  def note_error(error)
  end
end

class VerboseCrawlerLogger < SilentCrawlerLogger
  def enqueue(url)
    puts "url enqueued: #{url}"
  end

  def finalize_crawl(url)
    puts "finalize crawl: #{url}"
  end

  def spawn_crawling_thread(url)
    puts "spawning a crawler to look at #{url}"
  end

  def crawl_with_head_request(url)
    puts "crawling with HEAD request: #{url}"
  end

  def crawl_with_get_request(url)
    puts "crawling with GET request: #{url}"
  end

  def note_error(error)
    puts "error! #{error}"
  end
end
