crumb :root do
  link "Home", root_path
end

# user#index
crum :users do
  link "Users", users_path
  parent :root
end

# user#show
crum :show_user do |user|
  link user.name, user
  parent :users
end

# user#edit
crum :edit_user do |user|
  link "Edit #{user.name}", edit_user_path(user)
  parent :show_user, user
end

上記のように、crumの後にパンくずリストの名前を任意に設定し、do~endブロックの中にそのパンくずリストの設定を記述します。
上記ではuser＃index,user＃show,user＃editの書くViewで使うパンくずリストの設定を記述しています。
linkでパンくずリストとして表示するリンク名とそのリンクURLを指定しています。
また、parentで親リンクを指定しています。
パンくずリストで引数を取りたい場合は12行目、18行目のように、いつも通りブロックに引数を渡せばOKです。
後はView側でこの引数に対応する値を渡します。

１点注意点があり、user＃edit用のパンくずリストの設定箇所のparentでは親リンクとして:show_userを記述しており、そのあとに引数としてuserも渡す必要があります。
