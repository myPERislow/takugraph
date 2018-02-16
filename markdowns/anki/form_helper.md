- 特にここで送る必要はないけどformで送りたい時にhidden_fieldを使う
```ruby
<%= form_for @order do |f| %>
  <%= f.hidden_field :service, "test" %>
  <%= f.submit %>
<% end %>
```
だとうまくいきません。

値を指定するには

`<%= f.hidden_field :service, :value => "test" %>`
としましょう。

- :serverに"test"を入れたい時
