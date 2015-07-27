require_relative '../test_helper'

class CommentsControllerTest < ActionController::TestCase
  def setup
    @story = stories(:collector_collection)
  end

  test 'creates a comment for a story' do
    assert_difference '@story.comments.count', +1 do
      post 'create', story_id: @story.to_param, comment: { writer_id: writers(:eloy).to_param, body: 'No comments at this time.' }
    end
    assert_response :found
    # TODO assert story_url(assigns(:story))
    comment = @story.comments.reload.last
    assert_equal writers(:eloy), comment.writer
    assert_equal 'No comments at this time.', comment.body
  end
end
