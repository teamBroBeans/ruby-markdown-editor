class SharedNotesController < ApplicationController
     before_action :set_note, only: [:show]
#     before_action :authenticate_user!, :except => [:show]
  def show
      
      if @note
          render :show, :layout => nil
      else
        redirect_to root_url, notice: "That note does not exist"
      end
    end
  
  def set_note
      @note = Note.find_by(slug: params[:slug])
  end
  
  def note_params
      params.require(:note).permit(:title, :tag, :inputtext)
  end
end
