class AddExcerptToPosts < ActiveRecord::Migration
  def change
    add_column :basic_blog_posts, :excerpt, :text
  end
end
