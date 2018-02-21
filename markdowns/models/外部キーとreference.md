# Railsの外部キー制約とreference型について
- Railsで外部キーのカラムを追加する際に、 reference型を使うことがあると思います。
- reference型の使い方に関しては以下のように様々な記事があります。
- しかし、reference型で作成する時は`add_index: true`必要なの？
- `foreign_key`必要なの？
- と混乱してしまうので、備忘録のためにまとめておきます。

#### 前提
- アプリケーションとしてはTwitterの簡易版で、登録しているユーザーがツイートできるアプリケーションです。
- テーブル構造としては
- user:tweet = 1:N
- の関係になっています。
- テーブル名はそれぞれ、`users`と`tweets`です。

#### reference型を使わない場合

- まずはreference型を使わないで、外部キー制約のついたカラムを作成します。

#### 制約などなにもないカラムの作成
- 以下のように記述すると、インデックスが貼られない、外部キー制約もつかないカラムを作成することができます。

```ruby
# 2017_create_tweets.rb

class CreateTweets < ActiveRecord::Migratopm[5.0]
  def change
    create_table :tweets do |t|
      t.string :text
      t.integer :user_id
    end
  end
end
```

#### インデックスを貼るカラムの作成
- インデックスを貼る場合、２通りの書き方があるようです。

```ruby
# 2017_create_tweets.rb

class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :text
      t.integer :user_id, index: true #indexオプション
    end
  end
end
```

```ruby
# 2017_create_tweets.rb

class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :text
      t.integer :user_id
    end
    add_index :tweets, :user_id
    # add_index :対象テーブル名、インデックス対象のカラム名
  end
end
```

#### 外部キー制約が付いているカラムの作成
- reference型を使わない場合、`foreign_key: true`では外部キー制約にならないので注意が必要です。
- また、外部キー制約をつける場合、インデックスは自動で付与されるので、先ほどの`index: true`は不要になります！（便利ですね）

```ruby
# 20172017_create_tweets

class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :text
      t.integer :user_id
    end
    add_foreign_key :tweets, :users
    # add_foreign_key :対象のテーブル名、:指定先のテーブル
  end
end
```

#### reference型を使う場合
- 次に,reference型を使う場合の外部キー制約の付いたカラムを作成します。
#### reference型を使うメリット
- reference型を使い、`t.reference :user`と記述すると二つのメリットがある。
- `user`ではなく、　`user_id`というカラム名を作成してくれる。
- インデックスを自動で貼ってくれる。

```ruby
# 2017_create_tweets.rb

class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :text
      t.referece :user
    end
  end
end
```

- しかし、`t.reference :user`だけでは外部キー制約はつきません。
- ですので、reference型を使う場合は以下のように記述して、外部キー制約をつけることになります。
- reference型では外部キー制約をつけるときに`foreign_key: true` が使えるようになります！

```ruby
# 2017_create_tweets.rb

class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :text
      t.references :user, foreign_key: true
    end
  end
end
```

- ちなみに以下のように`add_foreign_key`でも大丈夫です。

```ruby
# 2017_create_tweets.rb

class CreateTweets < ActiveRecord::Migration[5.9]
  def change
    create_table :tweets do |t|
      t.string :text
      t.references :user
    end
    add_foreign_key :tweets, :users
  end
end
```

### まとめ
- 外部キー制約のついたカラムを作る際は、以下のように記述するのが手っ取りばやいです。

```ruby
# 2017_create_tweets
class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :text
      t.references :user, foreign_key: true
    end
  end
end
```

- ちなみに`add_column`の場合は以下の形が手っ取り早いです

```ruby
# 2017_add_column

class AddColumn < ActiveRecord::Migration[5.0]
  def change
    add_reference :tweets, :user, foreign_key: true
  end
end
```
