# 初期データの投入
# 開発用のダミーユーザや、都道府県情報のようなマスタデータ(ほぼ参照のみを行うデータ)を最初からデータベースに登録しておくと便利。
# Railsではdb/seeds.rbに定義を記述することで、データベースに初期データを投入できる。
#`bin/rails db:seed`で実行
# bin/rails db:seedは何回でも実行できる。

# config: utf-8
# 北海道 1
Area.create(prefecture: "北海道" )
# 東北地方 6
Area.create(prefecture: "青森県")
Area.create(prefecture: "秋田県")
Area.create(prefecture: "岩手県")
Area.create(prefecture: "山形県")
Area.create(prefecture: "宮城県")
Area.create(prefecture: "福島県")
# 関東地方 7
Area.create(prefecture: "栃木県")
Area.create(prefecture: "群馬県")
Area.create(prefecture: "神奈川県")
Area.create(prefecture: "東京都")
Area.create(prefecture: "埼玉県")
Area.create(prefecture: "茨城県")
Area.create(prefecture: "千葉県")
#中部地方 9
Area.create(prefecture: "静岡県")
Area.create(prefecture: "愛知県")
Area.create(prefecture: "山梨県")
Area.create(prefecture: "長野県")
Area.create(prefecture: "岐阜県")
Area.create(prefecture: "福井県")
Area.create(prefecture: "石川県")
Area.create(prefecture: "富山県")
Area.create(prefecture: "新潟県")
# 関西地方 7
Area.create(prefecture: "兵庫県")
Area.create(prefecture: "大阪府")
Area.create(prefecture: "京都府")
Area.create(prefecture: "滋賀県")
Area.create(prefecture: "三重県")
Area.create(prefecture: "奈良県")
Area.create(prefecture: "和歌山県")
# 中国地方
Area.create(prefecture: "岡山県")
Area.create(prefecture: "鳥取県")
Area.create(prefecture: "島根県")
Area.create(prefecture: "広島県")
Area.create(prefecture: "山口県")
# 四国地方
Area.create(prefecture: "香川県")
Area.create(prefecture: "徳島県")
Area.create(prefecture: "高知県")
Area.create(prefecture: "愛媛県")
# 九州地方
Area.create(prefecture: "長崎県")
Area.create(prefecture: "佐賀県")
Area.create(prefecture: "福岡県")
Area.create(prefecture: "大分県")
Area.create(prefecture: "熊本県")
Area.create(prefecture: "宮崎県")
Area.create(prefecture: "鹿児島県")
# 沖縄県
Area.create(prefecture: "沖縄県")
