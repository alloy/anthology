require_relative '../test_helper'

class StoriesControllerTest < ActionController::TestCase
  test 'shows a new page' do
    get 'new'
    assert_response :ok
    assert_template 'new'
  end
end
