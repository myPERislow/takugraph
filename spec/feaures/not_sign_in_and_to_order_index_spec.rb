require 'rails_helper'

RSpec.describe 'not_sign_in_and_to_order_index', type: :feature do
  def sign_in_and_to_index_order
    visit '/admin/orders'
    expect(path).to eq '/'
  end
end
