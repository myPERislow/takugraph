
- flash とは？
- ログイン時のウェルカムメッセージや、項目追加の成功通知など、ユーザに簡単な通知を行いたい時に利用する。
- コントローラでflashメッセージを設定し、ビューで表示する。
- flashは全体で見ればHash。
- あるキーに対する値としてメッセージを設定する。
- キーは自由に設定できるが、デフォルトとしてalertとnoticeがある。
- 設定したメッセージは、sessionに保存される。
- つまり、flashは、sessionを利用した機能の１つ。
- 普通のセッション変数では破棄するまで値は保持されるが、flashの場合は一度表示されるとアクション終了時に自動的に消去される。

- 使い方
- コントローラで定義
- flash[:notice] = "hogehoge"
- redirect_toのオプションとしても付加できる。

- redirect_to :root, :flash => {:error => "errorが起きました"}
- ビューで表示
- <%= flash[:alert] %>
- Rails2.x系では、noticeとalertがデフォルト。
- 例えば、redirect_toのときは、下記のように書ける。

- redirect_to :root, :notice => "hello"
- redirect_to :root, :alert => "errorが起きました"

- flashの種類
- flash
- 一度表示されるまで値が保持される。
- そのため、予期しないメッセージを表示してしまうことがあるので注意。
- そのアクション自体か、リダイレクトした次のアクションで利用。
- 一度表示された時点で破棄される。
- flash.now
- 定義したメソッド内（同じリクエスト内）でのみ有効。
- メソッド1で定義した場合、メソッド2では利用不可。
- redirectさせた先では表示されない。
- 使い方
- コントローラ
- flash.now[:notice] = "hello"
- ビュー
- <%= flash[:notice] %>
- flash.keep
- 普通flashは一度表示されると消えるが、flash.keepで設定すれば、値を保持し続ける。
- 引数なしで .keep を指定すればすべての flash が保持される。
- 使い方
- コントローラ
- flash[:notice] = "hoge"
- flash.keep(:notice) #引数なしで、flash.keepとすれば、全てのflashの値がkeepされる。
- ビュー
- <%= flash[:notice] %>
