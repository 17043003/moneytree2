class Admin::UsersController < Admin::Base
  before_action :login_required, except: [:new, :create]

  def top
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "ユーザー登録しました" if current_user
      # 新規登録後にログインしてトップページへリダイレクト
      session[:user_id] = @user.id
      redirect_to :root, notice: "ユーザー登録しました"
    
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to @user, notice: "ユーザー情報を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :users, notice: "ユーザーを削除しました"
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
