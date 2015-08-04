class CreateBasicBlogPosts < ActiveRecord::Migration
  def change
    create_table :basic_blog_posts do |t|
      t.string :title
      t.text :content
      t.datetime :published_at

      t.timestamps null: false
    end
  end
end
