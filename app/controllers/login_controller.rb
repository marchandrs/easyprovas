class LoginController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    if current_user
      redirect_to user_path(current_user)
    else
      redirect_to "/auth/facebook", id: "sign_in"
    end
  end
end
