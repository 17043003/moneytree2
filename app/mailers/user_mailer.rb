class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def signup_email
    @user = params[:user]
    mail(to: @user.email, subject: "登録完了!")
  end
end
