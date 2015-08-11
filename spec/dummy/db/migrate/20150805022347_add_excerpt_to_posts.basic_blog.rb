# This migration comes from basic_blog (originally 20150805021440)
class AddExcerptToPosts < ActiveRecord::Migration
  def change
    add_column :basic_blog_posts, :excerpt, :text
  end
end
