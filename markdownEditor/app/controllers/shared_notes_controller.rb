class SharedNotesController < ApplicationController
  def show
      @note = Note.where(slug: params[:slug])
      if @note
        render :show
      else
        redirect_to root_url, notice: "That note does not exist"
      end
    end
end
