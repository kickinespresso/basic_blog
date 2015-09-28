class AddImageToPost < ActiveRecord::Migration
  def change
    add_column :basic_blog_posts, :image, :string
  end
end
