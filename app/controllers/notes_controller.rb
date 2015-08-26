class NotesController < ApplicationController

  def index
    @notes = Note.all
    render :json => @notes.to_json
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      render :json => @note.to_json, serializer: NoteSerializer
    else
      render :json => @note.errors.to_json
    end
  end

  private

  def note_params
    params.permit(:title, :body, :tags)
  end
end
