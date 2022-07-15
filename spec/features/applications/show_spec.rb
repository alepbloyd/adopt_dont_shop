require 'rails_helper'

RSpec.describe 'application show' do

  it 'contains the name, address, bio, list of pets, and the application status for given application' do

    application_1 = Application.create!(
      first_name: "Alex",
      last_name: "Boyd",
      street_address: "123 Sesame Street",
      city: "Washington",
      state: "District of Columbia",
      applicant_bio: "Hey lemme have that cat or else",
      application_status: "Pending"
    )
    shelter = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)

    pet_1 = Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: shelter.id)

    pet_2 = Pet.create!(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: shelter.id)

    pet_3 = Pet.create!(adoptable: false, age: 2, breed: 'saint bernard', name: 'Beethoven', shelter_id: shelter.id)


    ApplicationPet.create!(application: application_1, pet: pet_1)
    ApplicationPet.create!(application: application_1, pet: pet_2)
    ApplicationPet.create!(application: application_1, pet: pet_3)

    visit "/applications/#{application_1.id}"

    expect(page).to have_content(application_1.first_name)
    expect(page).to have_content(application_1.last_name)
    expect(page).to have_content(application_1.street_address)
    expect(page).to have_content(application_1.city)
    expect(page).to have_content(application_1.state)
    expect(page).to have_content(application_1.applicant_bio)
    
    within '#pet-1' do
      expect(page).to have_content(pet_1.name)
      click_link "#{pet_1.name}"
      expect(current_path).to eq("/pets/#{pet_1.id}")
    end
    
    visit "/applications/#{application_1.id}"

    within '#pet-2' do      
      expect(page).to have_content(pet_2.name)
      click_link "#{pet_2.name}"
      expect(current_path).to eq("/pets/#{pet_2.id}")
    end

    visit "/applications/#{application_1.id}"

    within '#pet-3' do      
      expect(page).to have_content(pet_3.name)
      click_link "#{pet_3.name}"
      expect(current_path).to eq("/pets/#{pet_3.id}")
    end

  end

  it 'has a section to search for pets by name, and when I click submit, I am taken back to the application show page and shown the pet whose names match my search' do

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

    shelter = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)

    pet_1 = Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'LuciTESTlle Bald', shelter_id: shelter.id)

    pet_2 = Pet.create!(adoptable: true, age: 3, breed: 'doberman', name: 'TEST', shelter_id: shelter.id)

    pet_3 = Pet.create!(adoptable: false, age: 2, breed: 'saint bernard', name: 'BeethovTESTen', shelter_id: shelter.id)

    pet_4 = Pet.create!(adoptable: false, age: 2, breed: 'saint bernard', name: 'No', shelter_id: shelter.id)
    
    pet_5 = Pet.create!(adoptable: false, age: 2, breed: 'saint bernard', name: 'Nope', shelter_id: shelter.id)
    
    pet_6 = Pet.create!(adoptable: false, age: 2, breed: 'saint bernard', name: 'Not this one', shelter_id: shelter.id)

    visit "/applications/#{application_1.id}"

    fill_in "pet_name_search", with: "TEST"

    click_on "Pet Name Search"

    expect(current_path).to eq("/applications/#{application_1.id}")

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_3.name)

    expect(page).to_not have_content(pet_4.name)
    expect(page).to_not have_content(pet_5.name)
    expect(page).to_not have_content(pet_6.name)
  end

  it 'is case insenitive in pet search' do
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

    shelter = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)

    pet_1 = Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucitestlle Bald', shelter_id: shelter.id)

    pet_2 = Pet.create!(adoptable: true, age: 3, breed: 'doberman', name: 'TEST', shelter_id: shelter.id)

    pet_3 = Pet.create!(adoptable: false, age: 2, breed: 'saint bernard', name: 'BeethovTEsTen', shelter_id: shelter.id)

    pet_4 = Pet.create!(adoptable: false, age: 2, breed: 'saint bernard', name: 'No', shelter_id: shelter.id)
    
    pet_5 = Pet.create!(adoptable: false, age: 2, breed: 'saint bernard', name: 'Nope', shelter_id: shelter.id)
    
    pet_6 = Pet.create!(adoptable: false, age: 2, breed: 'saint bernard', name: 'Not this one', shelter_id: shelter.id)

    visit "/applications/#{application_1.id}"

    fill_in "pet_name_search", with: "test"

    click_on "Pet Name Search"

    expect(current_path).to eq("/applications/#{application_1.id}")

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_3.name)

    expect(page).to_not have_content(pet_4.name)
    expect(page).to_not have_content(pet_5.name)
    expect(page).to_not have_content(pet_6.name)
  end

end