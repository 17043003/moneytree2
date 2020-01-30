class UserMailer < ApplicationMailer
  default from: "from@gmail.com"

  def signup_email
    @user = params[:user]
    @url = :root_path
    mail(
      to: @user.email,
      subject: "登録完了!"
    ) do |format|
        format.text
      end
  end
end
