```ruby
belongs_to :order, optional: true
```


rails5では`has_many:`と`belongs_to`の紐付けをするとき、デフォルトで`require`になるので通常では`nil`での保存ができなくなるので、`optional: true`で解決
