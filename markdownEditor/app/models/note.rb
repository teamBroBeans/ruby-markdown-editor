class Note < ActiveRecord::Base
    validates_presence_of :title, :tag, :inputText
    validates :title, length: { maximum: 250,too_long: "%{count} characters is the maximum allowed"}
    
    def self.find_all_by_query(query) query = query.downcase
    query = "%#{query}%"
    Note.where(['lower(title) like ?', query]) end

end
