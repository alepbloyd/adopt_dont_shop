require 'rails_helper'

RSpec.describe Cart do

  it 'can caluculate number of pets in cart' do
    cart = Cart.new(["pet1","pet2"])

    expect(cart.count).to eq(2)
  end

  it 'can add pets to cart' do
    @shelter = FactoryBot.create(:shelter)
    @pet_1 = FactoryBot.create(:pet, shelter: @shelter)
    @pet_2 = FactoryBot.create(:pet, shelter: @shelter)

    @cart = Cart.new({})

    @cart.add_pet(@pet_2.id)

    expect(@cart.contents).to eq({
      @pet_2.id.to_s => 1 
    })
  end

end