class Tag < ActiveRecord::Base
	has_many :note_tags
	has_many :notes, :through => :note_tags
end
