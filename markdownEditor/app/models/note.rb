class Note < ActiveRecord::Base
    validates_presence_of :title, :tag, :inputText
    validates :title, length: { maximum: 250,too_long: "%{count} characters is the maximum allowed"}
    has_many :note_tags
    has_many :tags, :through => :note_tags

    # Create tags from :tag
    def set_all_tags
        self.tags = tag.split(",").map do |name|
            Tag.where(name: name.strip).first_or_create!
        end
    end
    
    # Get :tag string from tags
    def get_all_tags
        self.tags.map(&:name).join(", ")
    end
end
