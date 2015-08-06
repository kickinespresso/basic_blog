class AddSlugToPosts < ActiveRecord::Migration
  def change
    add_column :basic_blog_posts, :slug, :string
    add_index :basic_blog_posts, :slug, unique: true
  end
end
