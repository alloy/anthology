require_relative '../test_helper'

class TestApplicationsController < ApplicationController
  allow_access(:authenticated, only: :private_action) { @authenticated.email == 'eloy@artsymail.com' }
  allow_access(:all,           only: :public_action)

  def private_action
    head :ok
  end

  def public_action
    head :ok
  end
end

Rails.application.routes.send(:eval_block, lambda do
  get '/private_action' => 'test_applications#private_action'
end)

class TestApplicationsControllerTest < ActionController::TestCase
  test 'requires a user to be authenticated' do
    get :private_action
    assert_redirected_to @controller.url_for('/auth/artsy')
  end

  test 'renders a forbidden view if access is forbidden' do
    sign_in(writers(:katarina))
    get :private_action
    assert_response :forbidden
  end

  test 'redirects a writer to the edit page if they haven’t provided all required information yet' do
    writer = Writer.create!(email: 'eloy@artsymail.com')
    sign_in(writer)
    get :private_action
    assert_redirected_to edit_writer_url(writer)
  end

  test 'does not redirect a writer to the edit page if they have provided all required information' do
    sign_in(writers(:eloy))
    get :private_action
    assert_response :ok
  end
end
