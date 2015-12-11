ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def assert_valid_key(model, key, value)
    model.send("#{key}=", value)
    model.valid?
    assert model.errors[key].empty?, "Expected #{model.class} to not have validation errors on `#{key}' with value `#{value.inspect}'."
  end

  def assert_invalid_key(model, key, value)
    model.send("#{key}=", value)
    model.valid?
    assert !model.errors[key].empty?, "Expected #{model.class} to have validation errors on `#{key}' with value `#{value.inspect}'."
  end
end

class ActionController::TestCase
  def sign_in(writer)
    @authenticated = writer
    request.session[:writer_id] = @authenticated.id
  end
  
  def sign_out
    request.session.delete(:writer_id)
  end
  
  def authenticated?
    !request.session[:writer_id].blank?
  end
  
  def access_denied?
    response.status.to_i == 403
  end
  
  def sign_in_required?
    response.header['Location'] == new_session_url
  end
end
