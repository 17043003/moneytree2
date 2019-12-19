class UsersController < ApplicationController
  def index
    @users = User.all
    @new_user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "ユーザーを登録しました"
    else
      # render ""
    end
  end

  private def user_params
    params.require(:user).permit(
      :name,
      :email
    )
  end
end