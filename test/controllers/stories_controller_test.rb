require_relative '../test_helper'

class StoriesControllerTest < ActionController::TestCase
  test 'shows a new story page' do
    get 'new'
    assert_response :ok
    assert_template 'new'
  end

  test 'creates a story' do
    assert_difference 'Story.count', +1 do
      post 'create', story: { writer_id: writers(:eloy).to_param,
                              cadre_id: cadres(:mobile_engineering).to_param,
                              role_id: roles(:collector).to_param,
                              feature: 'to be able to create stories',
                              objective: 'I can have a better overview of the required work' }
    end
    assert_response :found
    # TODO assert story_url(assigns(:story))
  end

  test 'shows a story' do
    get 'show', id: stories(:collector_collection).to_param
    assert_response :ok
    assert_template 'show'
  end
end
