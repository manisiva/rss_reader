require 'feedjira'
class FeedsController < ApplicationController
  def fetch_feeds
    @feed_urls = FeedUrl.all
  end
    
  def rss_reader
    feed_hash = FeedUrl.rss_reader_hooks
    @feeds = feed_hash.sort_by { |k, v| v[:published] }
    @feeds.reverse!
  end

end
