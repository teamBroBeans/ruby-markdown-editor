class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :get_tags, only: [:new, :edit, :create, :update]
  
  def get_tags 
    @tags = ActsAsTaggableOn::Tag.all.map{|t| t.name}.to_json
  end
  
  # GET /notes
  # GET /notes.json
  def index
      if params[:q]
          @notes = Note.find_all_by_query(params[:q])
      else
          @notes = Note.all
      end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @note.tag = @note.get_all_tags
    # @note.tag.map{|tag| tag.name}.to_json.html_safe
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
    @note.tag = @note.get_all_tags
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)

    respond_to do |format|

      if @note.save
        @note.set_all_tags
        format.html { render :edit}
        flash[:notice] = "Note successfully created"
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
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
          format.html { render :edit}
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
