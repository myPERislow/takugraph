class AlbumMailer < ApplicationMailer
  default from:'ラブグラフ事務局<tainaisaibou@gmail.com>'

  def create_album
    mail(
      to: 'facebook.eikogakuen@gmail.com',
      subject: '納品が完了しました'
    )
  rescue => e
    notifier = Slack::Notifier.new('https://hooks.slack.com/services/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')
    notifier.ping(e)
  end

  def update_album
    mail(
      to: 'facebook.eikogakuen@gmail.com',
      subject: '納品内容が変更されました'
    )
  rescue => e
    notifier = Slack::Notifier.new('https://hooks.slack.com/services/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')
    notifier.ping(e)
  end
end
