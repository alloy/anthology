class CommentsController < ApplicationController
  allow_access :authenticated

  def create
    @story = Story.find(params[:story_id])
    comment = @story.comments.build(comment_params)
    if comment.save
      redirect_to story_url(@story)
    else
      # TODO
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:writer_id, :body)
  end
end
