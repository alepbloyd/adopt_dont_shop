# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ApplicationPet.destroy_all
Pet.destroy_all
Application.destroy_all
Shelter.destroy_all
Veterinarian.destroy_all
VeterinaryOffice.destroy_all

application_1 = Application.create!(
  first_name: "Alex",
  last_name: "Boyd",
  street_address: "123 Sesame Street",
  city: "Washington",
  zip_code: 20005,
  state: "District of Columbia",
  applicant_bio: "Hey lemme have that cat or else",
  application_status: "Pending"
)

shelter_1 = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)

pet_1 = Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucitestlle Bald', shelter_id: shelter_1.id)

pet_2 = Pet.create!(adoptable: true, age: 3, breed: 'doberman', name: 'TEST', shelter_id: shelter_1.id)

pet_3 = Pet.create!(adoptable: true, age: 2, breed: 'saint bernard', name: 'BeethovTeSten', shelter_id: shelter_1.id)

pet_4 = Pet.create!(adoptable: true, age: 2, breed: 'saint bernard', name: 'No', shelter_id: shelter_1.id)

pet_5 = Pet.create!(adoptable: true, age: 2, breed: 'saint bernard', name: 'Nope', shelter_id: shelter_1.id)

pet_6 = Pet.create!(adoptable: true, age: 2, breed: 'saint bernard', name: 'Not this one', shelter_id: shelter_1.id)

ApplicationPet.create!(application: application_1, pet: pet_1)
ApplicationPet.create!(application: application_1, pet: pet_2)
ApplicationPet.create!(application: application_1, pet: pet_3)