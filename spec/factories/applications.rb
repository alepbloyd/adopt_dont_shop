require 'faker'

FactoryBot.define do
  factory :application do
    first_name { Faker::Name.first_name }
    last_name {Faker::Name.first_name}
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip_code { Faker::Address.zip_code[0,5] }
    applicant_bio { Faker::Lorem.paragraph }
  end
end