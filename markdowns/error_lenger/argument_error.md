## class ArgumentError

##### クラスの継承リスト：ArgumentError < StandardError < Exception < Object < Kernel < BasicObject

### 要約
引数の数があっていないときや、数は合っていて、期待される振る舞いを持ってはいるが、期待される値ではないときに発生します。

```ruby
Time.at   # => wrong number of arguments (given 0, expected 1..2)(ArgumentError)
Array.new(-1) # => negative array size(ArgumentError)
```
- 引数の個数が間違っている
- 引数の中身が不正なとき
  - 1以上の整数じゃなきゃダメとか
  - 再帰しているArrayがダメとか
