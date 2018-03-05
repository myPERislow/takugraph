class OrderMailer < ApplicationMailer
  default from: 'tainaisaibou@gmail.com'

  def post_email(user, post)
    @title = post.title
    mail to: user.email, subject: "申し込みをしました"
  end
end
