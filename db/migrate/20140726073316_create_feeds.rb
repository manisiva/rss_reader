class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :name
      t.string :author
      t.datetime :published_at
      t.text :content
      t.timestamps
    end
  end
end
