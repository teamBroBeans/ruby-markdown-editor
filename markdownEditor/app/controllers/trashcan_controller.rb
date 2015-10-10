class TrashcanController < ApplicationController
  def index
    @notes = Note.where(:inTrashcan => true)
  end

  def create
    @note = Note.find(params[:id])
    @note.inTrashcan = true
    
    @note.save
    
    redirect_to notes_url
  end

  def delete
    @note = Note.find(params[:id])
    
    @note.destroy
    
    redirect_to trashcan_url, notice: "Your note #{note.title} was successfully deleted"
  end
  
  def deleteall
    @notes = Note.where(:inTrashcan => true)
    @notes.each do |note|
      note.destroy
    end
    
    redirect_to trashcan_url, notice: "All notes successfully deleted from trash can"
  end
  
  def undo
    @note = Note.find(params[:id])
    @note.inTrashcan = false
    @note.save
    
    redirect_to trashcan_url, notice: "Your note was successfully removed from the trash can."
  end
end
