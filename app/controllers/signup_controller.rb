class SignupController < ApplicationController
#   before_action :login_required

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/users/top"
    else
      render "signup"
    end
  end

  private def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :administrator
    )
  end
end
