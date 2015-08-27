class Api::TagsController < ApplicationController



  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      render :json => @tag, serializer: NoteSerializer
    else
      render :json => @tag.errors.to_json
    end
  end

  def show
    @tag = Tag.find_by_name(params[:name])
    render :json => @tag, serializer: FullNoteSerializer, :root => "tag"
  end

  private

  def tag_params
    params.permit(:name)
  end

end
