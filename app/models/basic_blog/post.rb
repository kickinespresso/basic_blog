module BasicBlog
  class Post < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]
    acts_as_taggable
    validates_presence_of :title
    scope :published, -> { where.not(:published_at => nil) }
    paginates_per 2
    attr_accessor :published_at_date, :published_at_time


    def set_published!
      if self.published_at_date || self.published_at_time
        self.published_at = if self.published_at_time.nil?
                              DateTime.parse "#{self.published_at_date}"
                            elsif self.published_at_date.nil?
                              DateTime.parse "#{Date.today} #{self.published_at_time}"
                            else
                              DateTime.parse("#{self.published_at_date} #{self.published_at_time}")
                            end
      else
        self.published_at = Time.now unless self.published_at
      end
    end
  end
end
