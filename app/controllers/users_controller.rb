class UsersController < ApplicationController
  before_action :login_required, except: [:new, :create]

  def top
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save

      # 登録出来たらメールを送信
      UserMailer.with(user: @user).signup_email.deliver_later
      redirect_to @user, notice: "ユーザー登録しました" if current_user
      # 新規登録後にログインしてトップページへリダイレクト
      session[:user_id] = @user.id
      redirect_to :root, notice: "ユーザー登録しました"
    
    else
      render "new"
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :root, notice: "ユーザーを削除しました"
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
