class Note < ActiveRecord::Base
    validates_presence_of :title, :tag, :inputText
end
