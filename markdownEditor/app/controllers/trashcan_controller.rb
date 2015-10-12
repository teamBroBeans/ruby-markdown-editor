class TrashcanController < ApplicationController
  def index
    @notes = Note.where(:inTrashcan => true)
    @notes = Note.where('user_id = ? AND
                            inTrashcan = ?', current_user, true)
  end

  def create
    @note = Note.find(params[:id])
    @note.inTrashcan = true
    @note.user = current_user
    @note.save
    
    redirect_to notes_url
  end

  def delete
    @note = Note.find(params[:id])
    
    @note.destroy
    
    redirect_to trashcan_url
  end
  
  def deleteall
    @notes = Note.where(:inTrashcan => true)
    @notes.each do |note|
      note.destroy
    end
    
    redirect_to trashcan_url
  end
  
  def undo
    @note = Note.find(params[:id])
    @note.inTrashcan = false
    @note.save
    
    redirect_to trashcan_url
  end
end
