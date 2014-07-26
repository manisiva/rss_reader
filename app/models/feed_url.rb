class FeedUrl < ActiveRecord::Base
  attr_accessible :url_name

  def self.rss_reader_hooks
    feed_urls = self.all
    feed_hash={}
    feed_urls.each do |feed_url| 
      feed = Feedjira::Feed.fetch_and_parse(feed_url.url_name)
      entry = feed.entries if !feed.kind_of?(Fixnum)
      unless entry.blank? 
        entry.each do |item|
          feed_hash[item.url]={:title => item.title, :url => item.url,
            :published => !item.published.nil?  ? item.published : DateTime.new(2001,2,3) }
        end
      end
    end
    feed_hash
  end
end
