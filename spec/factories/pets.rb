require 'faker'

FactoryBot.define do
  factory :pet do
    adoptable { [true,true,true,false].sample }
    age { rand(1..20) }
    breed { Faker::Creature::Animal.name }
    name {
      [true,false].sample ? 
      Faker::Creature::Cat.name : Faker::Creature::Dog.name
    }
  end
end
