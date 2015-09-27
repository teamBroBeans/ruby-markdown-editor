class Note < ActiveRecord::Base
    validates_presence_of :title, :tag, :inputText
    validates :title, length: { maximum: 250,too_long: "%{count} characters is the maximum allowed"}
    has_many :note_tags
    has_many :tags, :through => :note_tags

end
