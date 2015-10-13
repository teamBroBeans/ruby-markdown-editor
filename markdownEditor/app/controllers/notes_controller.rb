class NotesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_note, only: [:share, :edit, :update, :destroy]
  before_action :get_tags, only: [:share, :new, :edit, :create, :update]

  def get_tags 
    @tags = Tag.pluck(:name).map{|t| t}.to_json

  end

  
  def index
    
    if current_user
      
      @notes = Note.where('user_id = ? AND
                            inTrashcan = ?', current_user, false)

    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end


  def share
    @note.share
    if @note.save
        redirect_to edit_note_path(@note), notice: "Shared note."
        else
        render :edit
    end
  end

# GET /notes/new
  def new
    # if current_user
      @note = current_user.notes.new
      # @note = Note.new
    # end
  end

  # GET /notes/1/edit
  def edit
    @note.tag = @note.get_all_tags
  end

  # POST /notes
  # POST /notes.json
  def create

    @note = Note.new(note_params)
    @note.user = current_user
    @note.inTrashcan = false
    respond_to do |format|

      if @note.save
        @note.set_all_tags
        flash[:notice] = "Note successfully created"
        format.html { redirect_to edit_note_path(@note), notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
          @note.set_all_tags
          format.html { redirect_to edit_note_path(@note), notice: "Note was updated successfully."}
          flash[:notice] = "Note successfully updated"
          format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
       @note = Note.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :tag, :inputText)
    end
end
