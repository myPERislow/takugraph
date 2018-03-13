require 'rails_helper'

RSpec.describe 'sign_in_as_member_and_to_index_order', type: :feature do
  def sign_in_and_to_index_order
    visit '/users/sign_in'
    # factoriesをチェック!!
    identity = build(:identity)
    fill_in :email, with: identity.email
    fill_in :password, with: identity.password
    # ログイン画面のvalue属性をチェック!!
    click_on 'ログイン'

    visit '/admin/orders'
    expect(path).to eq
  end
end
