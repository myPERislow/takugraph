require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'is not be valid without first_name' do
    user = Order.new(first_name: '',last_name: 'aaa',day:'2018/05/01',location:'赤レンガ倉庫',phone_number:'08070708888')
    expect(user).not_to be_valid
  end

  it 'is not be valid without last_name' do
    user = Order.new(first_name: 'aaa',last_name: '',day:'2018/05/01',location:'赤レンガ倉庫',phone_number:'08070708888')
    expect(user).not_to be_valid
  end

  it 'is not be valid without day' do
    user = Order.new(first_name: 'aaa',last_name: 'aaa',day:'',location:'赤レンガ倉庫',phone_number:'08070708888')
    expect(user).not_to be_valid
  end

  it 'is not be valid without location' do
    user = Order.new(first_name: 'aaa',last_name: 'aaa',day:'2018/05/01',location:'',phone_number:'08070708888')
    expect(user).not_to be_valid
  end

  it 'is not be valid without phone_number' do
    user = Order.new(first_name: 'aaa',last_name: 'aaa',day:'2018/05/01',location:'赤レンガ倉庫',phone_number:'')
    expect(user).not_to be_valid
  end
end
