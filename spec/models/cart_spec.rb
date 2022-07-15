require 'rails_helper'

RSpec.describe Cart do

  it 'can caluculate number of pets in cart' do
    cart = Cart.new(["pet1","pet2"])
    expect(cart.length).to eq(2)
  end

end