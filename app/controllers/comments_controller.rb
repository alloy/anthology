class CommentsController < ApplicationController
  allow_access :authenticated

  def create
    @story = Story.find(params[:story_id])
    comment = @story.comments.build(writer: @authenticated, body: params[:comment][:body])
    if comment.save
      redirect_to story_url(@story)
    else
      # TODO
    end
  end
end
