class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def destroy
    session[:user_id] = nil
    unset_current_user
    redirect_to root_path
  end
end
