class Note < ActiveRecord::Base
    validates_presence_of :title, :tag, :inputText
    validates :title, length: { maximum: 250,too_long: "%{count} characters is the maximum allowed"}
    has_many :notes_tags
    has_many :tags, :through => :notes_tags

    # Create tags from :tag
    def set_all_tags
        self.tags = tag.split(", ").map do |name|
            Tag.where(name: name.strip).first_or_create!
        end
    end
    
    # Get :tag string from tags
    def get_all_tags
        self.tags.map(&:name).join(", ")
    end
    
    def self.find_all_by_query(query)
        query = query.downcase
        query = "%#{query}%"
        
        Note.where(['lower(title) like ?
                   OR lower(tag) like ?
                   OR lower(inputText) like ?',
                   query, query, query])
    end
end
