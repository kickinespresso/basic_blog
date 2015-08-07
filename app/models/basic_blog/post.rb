module BasicBlog
  class Post < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]
    acts_as_taggable
    validates_presence_of :title
  end
end
