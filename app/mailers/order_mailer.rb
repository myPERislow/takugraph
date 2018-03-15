class OrderMailer < ApplicationMailer
  default from:'ラブグラフ事務局<tainaisaibou@gmail.com>'

  def post_order()
    mail(
      to: 'facebook.eikogakuen@gmail.com',
      subject: '申し込みを完了しました'
    )
  rescue => e
    notifier = Slack::Notifier.new('https://hooks.slack.com/services/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')
    notifier.ping(e)
  end


  def photographer_post_order()
    mail(
      to: 'facebook.eikogakuen@gmail.com',
      subject: 'カメラマンが自動アサインされ申し込みが完了しました'
    )
  rescue => e
    notifier = Slack::Notifier.new('https://hooks.slack.com/services/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')
    notifier.ping(e)
  end


  def update_order()
    mail(
      to: 'facebook.eikogakuen@gmail.com',
      subject: '申し込み内容が変更されました'
    )
  rescue => e
    notifier = Slack::Notifier.new('https://hooks.slack.com/services/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')
    notifier.ping(e)
  end
end
