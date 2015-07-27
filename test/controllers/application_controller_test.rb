require_relative '../test_helper'

class TestApplicationsController < ApplicationController
  allow_access :admin, :only => :private_action
  allow_access :all, :except => :private_action
  
  def private_action
    render :nothing => true
  end

  def public_action
    render :nothing => true
  end
end

Rails.application.routes.send(:eval_block, lambda do
  get '/private_action' => 'test_applications#private_action'
end)

class TestApplicationsControllerTest < ActionController::TestCase
  test "requires a user to be authorized" do
    get :private_action
    assert_redirected_to @controller.url_for('/auth/artsy')
  end
end
