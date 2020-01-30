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

  def notice_email
    # @user = []
    # @user << User.find_by(name: "masaya")
    # @user << User.find_by(name: "ishizuka")

    # @user.each do |user|
    # mail(
    #   to: user.email,
    #   subject: "今月の収支 お知らせ"
    # ) do |format|
    #     format.text
    #   end
    # end

    @user = User.find_by(name: "masaya")
    mail(
      to: @user.email,
      subject: "今月の収支 お知らせ"
    ) do |format|
        format.text
      end
  end
end
