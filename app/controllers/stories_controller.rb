class StoriesController < ApplicationController
  allow_access :authenticated

  def index
    @stories = Story.all.group_by(&:cadre)
  end

  def new
    if params[:story_id]
      parent = Story.find(params[:story_id])
      @story = parent.children.build
    else
      @story = Story.new
    end
    @story.cadre = @authenticated.cadre
  end

  def create
    @story = Story.new(story_params.merge(writer: @authenticated))
    if @story.save
      redirect_to story_url(@story)
    else
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
    @list_items = (@story.comments + @story.children).sort_by(&:created_at)
    @related_stories = @story.children.group_by(&:cadre)
  end

  def update
    @story = Story.find(params[:id])
    @story.update_attribute(:implemented, params[:story][:implemented])
    redirect_to story_url(@story)
  end

  private

  def story_params
    params.require(:story).permit(:parent_id, :cadre_id, :role_id, :feature, :objective)
  end
end
