# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rails_helper'
require 'spec_helper'
require 'factory_bot_rails'
include FactoryBot::Syntax::Methods

ApplicationPet.destroy_all
Pet.destroy_all
Application.destroy_all
Shelter.destroy_all
Veterinarian.destroy_all
VeterinaryOffice.destroy_all


@shelters = []
@applications = []
@pets = []
@application_pets = []

(1..5).each do
  @shelters << FactoryBot.create(:shelter)
end

@shelters.each do |shelter|
  (1..20).each do 
    @pets << FactoryBot.create(:pet, shelter: shelter)
  end
end

(1..50).each do
  @applications << FactoryBot.create(:application)
end

def get_random_pet
  @pets.sample
end

def get_random_application
  @applications.sample
end

# require 'pry'; binding.pry 

(1..30).each do
  @application_pets << FactoryBot.create(:application_pet, application: get_random_application, pet: get_random_pet)
end