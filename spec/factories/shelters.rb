require 'faker'

FactoryBot.define do
  factory :shelter do
    foster_program { true }
    name { "#{Faker::Food.vegetables} Animal Shelter"}
    city { Faker::Address.city }
    rank { rand(1..20) }
  end
end

# dummy_shelter = FactoryBot.create(:shelter)
# dummy_pet = FactoryBot.create(:pet, shelter_id: dummy_shelter.id)