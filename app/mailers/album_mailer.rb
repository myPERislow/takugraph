class AlbumMailer < ApplicationMailer
  default from:'ラブグラフ事務局<tainaisaibou@gmail.com>'

  def create_album
    mail(
      to: 'facebook.eikogakuen@gmail.com',
      subject: '納品が完了しました'
    )
  end

  def update_album
    mail(
      to: 'facebook.eikogakuen@gmail.com',
      subject: '納品内容が変更されました'
    )
  end
end
