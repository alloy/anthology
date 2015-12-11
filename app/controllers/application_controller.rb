require 'authorization'
require 'authentication_needed_san'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :find_authenticated, :ensure_valid_writer, :block_access

  protected

  include Authorization::BlockAccess
  extend  Authorization::AllowAccess

  def find_authenticated
    @authenticated = Writer.find_by_id(request.session[:writer_id]) unless request.session[:writer_id].blank?
  end

  def ensure_valid_writer
    # When the user authenticates through oauth2, we don’t have any cadre info yet, so keep redirecting the user to the
    # edit form until they have provided all the required Writer information.
    redirect_to edit_writer_url(@authenticated) if @authenticated && !@authenticated.valid?
  end

  def access_forbidden
    # The user is authenticated, just not authorized
    if @authenticated
      head :forbidden
    else
      flash.keep
      authentication_needed!
    end
  end

  def when_authentication_needed
    redirect_to new_session_url
  end

  def sign_in(writer)
    request.session[:writer_id] = writer.id
  end

  def sign_out
    request.session.delete(:writer_id)
  end
end
