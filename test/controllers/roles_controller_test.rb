require_relative '../test_helper'

class RolesControllerTest < ActionController::TestCase
  def setup
    sign_in(writers(:eloy))
  end

  test 'shows a list of roles' do
    get :index
    assert_response :ok
    assert_template 'roles/index'
  end

  test 'shows a new role page' do
    get :new
    assert_response :ok
    assert_template 'roles/new'
  end

  test 'creates a new role' do
    assert_difference 'Role.count', +1 do
      post :create, role: { name: 'Artsy Employee', definition: 'A person working at Artsy.' }
    end
    assert_redirected_to roles_url
    assert_equal 'Artsy Employee', Role.last.name
    assert_equal 'A person working at Artsy.', Role.last.definition
  end

  test 'shows a role page' do
    get :show, id: roles(:collector).to_param
    assert_response :ok
    assert_template 'roles/show'
    assert_equal assigns(:role), roles(:collector)
  end

  test 'shows an edit page' do
    get :edit, id: roles(:collector).to_param
    assert_response :ok
    assert_template 'roles/edit'
    assert_equal assigns(:role), roles(:collector)
  end

  test 'updates a role' do
    put :update, id: roles(:collector).to_param, role: { name: 'Art Collector' }
    assert_redirected_to role_url(roles(:collector))
    assert_equal 'Art Collector', roles(:collector).reload.name
  end
end
