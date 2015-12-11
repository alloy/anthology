require_relative '../test_helper'

class SessionsControllerTest < ActionController::TestCase
  test 'creates a new writer' do
    stub_omniauth_info(email: 'new-writer@artsymail.com', name: 'New Writer')
    assert_difference 'Writer.count', +1 do
      get :create
    end
    assert_equal 'new-writer@artsymail.com', assigns(:writer).email
    assert_equal 'New Writer', assigns(:writer).name
    assert_equal assigns(:writer).id, request.session[:writer_id]
    assert_redirected_to edit_writer_url(assigns(:writer))
  end

  test 'signs-in an existing writer' do
    stub_omniauth_info(email: writers(:eloy).email)
    assert_no_difference 'Writer.count' do
      get :create
    end
    assert_equal writers(:eloy).id, request.session[:writer_id]
    assert_redirected_to root_url
  end

  private

  def stub_omniauth_info(info)
    info.stringify_keys!
    omni_auth_hash = Object.new
    omni_auth_hash.define_singleton_method(:to_hash) { info }
    request.env['omniauth.auth'] = { info: { raw_info: omni_auth_hash } }
  end
end
