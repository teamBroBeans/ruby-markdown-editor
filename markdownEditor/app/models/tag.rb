class Tag < ActiveRecord::Base
	validates_presence_of :name
	has_many :note_tags
	has_many :notes, :through => :note_tags
end
