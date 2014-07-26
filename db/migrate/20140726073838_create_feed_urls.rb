class CreateFeedUrls < ActiveRecord::Migration
  def change
    create_table :feed_urls do |t|
      t.string :url_name

      t.timestamps
    end
  end
end
