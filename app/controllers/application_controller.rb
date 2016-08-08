class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  helper_method :current_user
  helper_method :logout_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logout_user
    session[:user_id] = nil
    @current_user = nil
  end

  def require_login
    unless current_user
      redirect_to "/auth/facebook", id: "sign_in"
    end
  end
end
