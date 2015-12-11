require_relative '../test_helper'

class CommentsControllerTest < ActionController::TestCase
  def setup
    sign_in(writers(:eloy))
    @story = stories(:collector_collection)
  end

  test 'creates a comment for a story' do
    assert_difference '@story.comments.count', +1 do
      post 'create', story_id: @story.to_param, comment: { body: 'No comments at this time.' }
    end
    assert_redirected_to story_url(@story)
    comment = @story.comments.reload.last
    assert_equal writers(:eloy), comment.writer
    assert_equal 'No comments at this time.', comment.body
  end
end
