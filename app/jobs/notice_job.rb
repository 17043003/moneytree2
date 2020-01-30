class NoticeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    UserMailer.notice_email.deliver_later
  end
end
