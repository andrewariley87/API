class Api::NotesController < ApplicationController

  def index
    @notes = Note.all
    render :json => @notes, each_serializer: NoteSerializer
  end

  def create
    @note = Note.new(note_params)
    tags = params[:tags].split(",").collect(&:strip)
    if @note.save
      tags.each do |tag|
        @note.tags << Tag.find_or_create_by(:name => tag)
      end
      render :json => @note, serializer: NoteSerializer
    else
      render :json => @note.errors.to_json
    end
  end

  private

  def note_params
    params.permit(:title, :body)
  end
end
