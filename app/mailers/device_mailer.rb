class DeviceMailer < ApplicationMailer

  default from:'ラブグラフ事務局<tainaisaibou@gmail.com>'

  def new_user_registraion
    mail(
      to: 'facebook.eikogakuen@gmail.com',
      subject: '新規ユーザーが登録されました'
    )
  rescue => e
    notifier = Slack::Notifier.new('https://hooks.slack.com/services/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')
    notifier.ping(e)
  end
end
