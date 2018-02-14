## before_actionとは
- railsではcontrollerで`before_action`を定義することで、アクションの前に処理を差し込むことができる。
- 一般的に、複数のアクションで共通して必要になる処理などをbefore_actionで定義することが多い。
- 例えば、ログイン機能があるアプリケーションでは、各アクションでユーザーがログインしているかのチェックを行う必要が有る。
-このようなときに、ログイン認証の処理をbefore_actionとして定義しておけば、各アクションにアクセスが来たときに、最初にログイン認証を行って、そのあとに各アクション独自の処理をするといったことが可能になる。

## berfore_actionの使い方
- before_actionの使い方は次のようになる。controllerにbefore_actionとして処理したいメソッドを定義して、controllerのclass定義の下に次の書式でbefore_actionを定義する。

```ruby
class SampleController < ApplicationController
  before_action: メソッド名
  ・・・
  def メソッド名
    ・・・
  end
end
```
