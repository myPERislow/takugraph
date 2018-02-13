### 疑問 1

```ruby
<td><%= link_to '削除', admin_order_path(order), method: :delete</td>
```

のように`link_to`の消去で`method: :delete`を指定する理由は

`link_to`ではサーバーへのリクエスト方式のデフォルトが`get`であるから、`delete`methodを使いたい今回はわざわざ`method: :delete`を指定する必要があるから。

### 疑問 2

``` ruby
<%= form_for @order %>
```

これはこの表記以下のformでは`@order`を使いますよ。送信時も`@order`を使いますよという意思表示

### 疑問 3
##### 編集完了まで流れ

``` ruby
<% @orders.each do |order| %>
<tr>
  <td><%= link_to '詳細', admin_order_path(order) %></td>
  <td><%= link_to '編集', edit_admin_order_path(order)%></td>
  <td><%= link_to '削除', admin_order_path(order), method: :delete</td>
</tr>
<% end %>

```
- これで`編集`を押すと、`edit_admin_order_path`に`order`を
もったまま飛ばされる。

```ruby
def edit
  @order = Order.find(params[:id])
end
```
`order`が渡されたので、`params[:id]`には`order`に入っていたものの`id`が入っている。
これを`find`によって`Order`から探す。そして`@order`に渡す。
