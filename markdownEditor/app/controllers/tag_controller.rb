class EditorController < ApplicationController

  def index
     @tags = Note.find(:all, :conditions => ['tag LIKE ?', "%#{params[:tag]}%"])
  end

end
