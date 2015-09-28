if defined?(ActiveAdmin)
  ActiveAdmin.register  BasicBlog::Post, as: 'Post' do
    # customize your resource here

    form do |f|
      inputs 'Details' do
        f.input :title
        f.input :excerpt
        f.cktext_area :content
        f.input :published_at,   as: :datepicker, datepicker_options: { min_date: 3.days.ago.to_date, max_date: "+1W +5D" }

      end

      f.inputs "Image", :multipart => true do
        f.input :image, :as => :file, :hint => f.object.image.present? ? image_tag(f.object.image.url(:thumb)) : content_tag(:span, "no image yet")
        f.input :image_cache, :as => :hidden
      end
      actions
    end
    permit_params :title, :excerpt,:content, :slug, :published_at, :image, :image_cache

  end
end