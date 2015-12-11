require 'test_helper'

class WritersControllerTest < ActionController::TestCase
  def setup
    @writer = Writer.create!(email: 'new-writer@artsymail.com')
    sign_in(@writer)
  end

  test 'renders an edit form' do
    get :edit, id: @writer.to_param
    assert_response :ok
  end

  test 'does not render a form for another writer' do
    get :edit, id: writers(:katarina).to_param
    assert_response :forbidden
  end

  test 'updates the writer' do
    put :update, id: @writer.to_param, writer: { name: 'Updated', cadre_id: cadres(:mobile_engineering).to_param }
    assert_equal 'Updated', @writer.reload.name
    assert_redirected_to root_url
  end

  test 'does not update another writer' do
    put :update, id: writers(:katarina).to_param, writer: { name: 'Updated' }
    assert_not_equal 'Updated', writers(:katarina).name
    assert_response :forbidden
  end
end
