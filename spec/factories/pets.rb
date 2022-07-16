require 'faker'

FactoryBot.define do
  factory :pet do
    adoptable { true }
    age { rand(1..20) }
    breed { Faker::Creature::Animal.name }
    name { Faker::Creature::Cat.name }
  end
end
