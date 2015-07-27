class SessionsController < ApplicationController
  def create
    @writer = Writer.find_or_create_by_email(auth_hash[:info][:email])

    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
