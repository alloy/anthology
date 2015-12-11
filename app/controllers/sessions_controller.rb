class SessionsController < ApplicationController
  allow_access :all, only: :create

  def create
    if @writer = Writer.find_by_email(user_info[:email])
      sign_in(@writer)
      redirect_to root_url
    else
      @writer = Writer.create!(user_info.slice(:email, :name))
      sign_in(@writer)
      redirect_to edit_writer_url(@writer)
    end
  end

  protected

  def user_info
    request.env['omniauth.auth'][:info][:raw_info].to_hash.symbolize_keys
  end
end
