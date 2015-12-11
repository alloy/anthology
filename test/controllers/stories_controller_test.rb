require_relative '../test_helper'

class StoriesControllerTest < ActionController::TestCase
  def setup
    sign_in(writers(:eloy))
    @story = stories(:collector_collection)
  end

  test 'shows a list of stories' do
    get 'index'
    assert_response :ok
    assert_template 'index'
  end

  test 'shows a new story page' do
    get 'new'
    assert_response :ok
    assert_template 'new'
  end

  test 'creates a story' do
    assert_difference 'Story.count', +1 do
      post 'create', story: valid_story_params
    end
    assert_redirected_to story_url(assigns(:story))
  end

  test 'shows a story' do
    get 'show', id: @story.to_param
    assert_response :ok
    assert_template 'show'
  end

  test 'updates the status of a story' do
    @story.children.delete_all
    put :update, id: @story.to_param, story: { implemented: true }
    assert @story.reload.implemented?
    assert_redirected_to story_url(@story)
  end

  # children

  test 'shows a new child story page' do
    get 'new', story_id: @story.to_param
    assert_response :ok
    assert_template 'new'
    assert_equal @story, assigns(:story).parent
  end

  test 'creates a child story' do
    assert_difference '@story.children.count', +1 do
      post 'create', story: valid_story_params.merge(parent_id: @story.to_param)
    end
    assert_redirected_to story_url(@story)
  end

  private

  def valid_story_params
    {
      writer_id: writers(:eloy).to_param,
      cadre_id: cadres(:mobile_engineering).to_param,
      role_id: roles(:collector).to_param,
      feature: 'to be able to create stories',
      objective: 'I can have a better overview of the required work'
    }
  end
end
