
```ruby
has_one :album, dependent: :destroy
```

`dependnt: :destroy`は親にあたるモデルが削除されたら、子のモデルの扱いをどうするかを決めてくれるためのもの。

[詳細はこちら](http://blog.sanojimaru.com/post/18426241191/activerecordhasmany%E3%81%AEdependent%E3%82%AA%E3%83%97%E3%82%B7%E3%83%A7%E3%83%B3)
