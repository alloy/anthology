class StoriesController < ApplicationController
  def new
    if params[:story_id]
      parent = Story.find(params[:story_id])
      @story = parent.children.build
    else
      @story = Story.new
    end
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to story_url(@story)
    else
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  private

  def story_params
    params.require(:story).permit(:parent_id, :writer_id, :cadre_id, :role_id, :feature, :objective)
  end
end
