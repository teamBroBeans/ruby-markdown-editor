class SharedNotesController < ApplicationController
  def show
      @note = Note.find_by_slug @note
      if @note
        render :show
      else
        redirect_to root_url, notice: "That note does not exist"
      end
    end
end
