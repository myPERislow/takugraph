require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "Album#new" do
    context "納品枚数が必要枚数以下だとバリデーションエラー" do
      it "8枚の納品でhttp status 200のエラーが出る" do
        order = Order.new(id: 1,first_name: 'aa',last_name: 'aaa',day:'2018/05/01',location:'赤レンガ倉庫',phone_number:'08070708888', addtional_plans: [{:photo_number => 0}, ])
        nohin = Album.build!(order_id: 1, photographs: ["test1.jpg","test2.jpg", "test3.jpg",  "test4.jpg", "test5.jpg","test6.jpg", "test7.jpg","test8.jpg"])
        expect(nohin).to have_http_status(200)
      end
    end
  end
end
