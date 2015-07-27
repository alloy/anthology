require 'authorization'
require 'authentication_needed_san'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :find_authenticated, :block_access

  protected

  include Authorization::BlockAccess
  extend  Authorization::AllowAccess

  def find_authenticated
    #@authenticated ||= Member.find_by_id(request.session[:member_id]) unless request.session[:member_id].blank?
  end

  def access_forbidden
    # The user is authenticated, just not authorized
    if !@authenticated.nil?
      render status: :forbidden
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
