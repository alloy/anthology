require_relative '../test_helper'

class StoryValidationsTest < ActiveSupport::TestCase
  def setup
    @story = Story.new
  end

  test 'a story is valid with an associated role' do
    assert_invalid_key @story, :role_id, nil
    assert_valid_key @story, :role_id, roles(:collector).id
  end

  test 'a story is valid with an associated writer' do
    assert_invalid_key @story, :writer_id, nil
    assert_valid_key @story, :writer_id, writers(:rebecca).id
  end

  test 'a story is valid with an associated cadre' do
    assert_invalid_key @story, :cadre_id, nil
    assert_valid_key @story, :cadre_id, cadres(:collector_relations).id
  end

  test 'a story is valid with a feature description' do
    assert_invalid_key @story, :feature, nil
    assert_invalid_key @story, :feature, ' '
    assert_valid_key @story, :feature, 'access to my collection'
  end

  test 'a story is valid with an objective description' do
    assert_invalid_key @story, :objective, nil
    assert_invalid_key @story, :objective, ' '
    assert_valid_key @story, :objective, 'I can keep track of what art I own'
  end
end

class StoryTest < ActiveSupport::TestCase
  test 'a story creates a formatted sentence' do
    assert_equal 'As a collector, I want access to my collection, so that I can keep track of what art I own.', stories(:collector_collection).as_sentence
  end
end
