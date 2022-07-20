require 'rails_helper'

RSpec.describe ApplicationPet, type: :model do
  describe "relationships" do
    it {should belong_to :application}
    it {should belong_to :pet}
  end

  it 'should return name of pet associated with application_pet' do
    shelter_1 = FactoryBot.create(:shelter)
    pet_1 = FactoryBot.create(:pet, shelter: shelter_1)
    application_1 = FactoryBot.create(:application)

    application_pet = FactoryBot.create(:application_pet, pet: pet_1, application: application_1)

    expect(application_pet.pet_name).to eq(pet_1.name)
  end

  it 'returns application_pets in order of recently created first' do
    shelter_1 = FactoryBot.create(:shelter)

    pet_1 = FactoryBot.create(:pet, shelter: shelter_1)
    pet_2 = FactoryBot.create(:pet, shelter: shelter_1)
    pet_3 = FactoryBot.create(:pet, shelter: shelter_1)

    application_1 = FactoryBot.create(:application)
    application_2 = FactoryBot.create(:application)
    application_3 = FactoryBot.create(:application)

    application_pet_1 = FactoryBot.create(:application_pet, pet: pet_1, application: application_1,created_at: "2020-07-13 17:56:48.851122")
    application_pet_2 = FactoryBot.create(:application_pet, pet: pet_1, application: application_2,created_at: "2022-07-13 17:56:48.851122")
    application_pet_3 = FactoryBot.create(:application_pet, pet: pet_1, application: application_3, created_at: "2021-07-13 17:56:48.851122")

    expect(ApplicationPet.order_by_recently_created).to eq([application_pet_2,application_pet_3,application_pet_1])
  end
end