class Album < ApplicationRecord
  # モデルファイルにcarrierwaveをマウントする
  # 「マウントする」とは、コンピュータ本体に接続した周辺機器をOSなどのソフトウェアに認識させ、操作・利用可能な状態にすること。
  # コンピュータに接続した機器やメディアをコンピュータに認識させ、使える状態にすること。
  #carrierwaveのアップロード機能を実装するモデルにアップローダーを設置しておく必要がある。
  mount_uploaders :photographs, PhotoUploader
  # マウントすることによって、
  # モデルへの画像ファイルのアップロードが可能になる。
  # belongs_to :order
end
