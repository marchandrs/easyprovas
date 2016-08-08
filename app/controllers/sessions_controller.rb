class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    logout_user
    redirect_to root_path
  end
end
