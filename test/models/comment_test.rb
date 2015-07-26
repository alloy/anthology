require_relative '../test_helper'

class CommentValidationsTest < ActiveSupport::TestCase
  def setup
    @comment = Comment.new
  end

  test 'a comment is valid with an associated writer' do
    assert_invalid_key @comment, :writer_id, nil
    assert_valid_key @comment, :writer_id, writers(:rebecca).id
  end

  test 'a comment is valid with an associated story' do
    assert_invalid_key @comment, :story_id, nil
    assert_valid_key @comment, :story_id, stories(:collector_collection).id
  end
end
