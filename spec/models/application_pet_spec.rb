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
end