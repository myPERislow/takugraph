class OrderMailer < ApplicationMailer
  default from:'ラブグラフ事務局<tainaisaibou@gmail.com>'

  def post_order()
    mail(
      to: 'facebook.eikogakuen@gmail.com',
      subject: '申し込みを完了しました'
    )
  end

  def photographer_post_order()
    mail(
      to: 'facebook.eikogakuen@gmail.com',
      subject: 'カメラマンが自動アサインされ申し込みが完了しました'
    )
  end

  def update_order()
    mail(
      to: 'facebook.eikogakuen@gmail.com',
      subject: '申し込み内容が変更されました'
    )
  end
end
