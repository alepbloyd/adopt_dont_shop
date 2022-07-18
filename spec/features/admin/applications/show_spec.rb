require 'rails_helper'

RSpec.describe 'admin application show page' do

  it 'shows all pets associated with the application' do

    shelter_1 = FactoryBot.create(:shelter)

    pet_1 = FactoryBot.create(:pet, shelter: shelter_1)
    pet_2 = FactoryBot.create(:pet, shelter: shelter_1)
    pet_3 = FactoryBot.create(:pet, shelter: shelter_1)
    pet_4 = FactoryBot.create(:pet, shelter: shelter_1)

    application_1 = FactoryBot.create(:application)

    application_pet_1 = FactoryBot.create(:application_pet, application: application_1, pet: pet_1)
    application_pet_1 = FactoryBot.create(:application_pet, application: application_1, pet: pet_2)
    application_pet_1 = FactoryBot.create(:application_pet, application: application_1, pet: pet_3)

    visit "/admin/applications/#{application_1.id}"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_3.name)
    expect(page).to_not have_content(pet_4.name)
  end

  it 'has a button to approve application for specific pet, which takes user back to admin/application/show page, where the button for that pet is gone and there is an indication that the pet is approved' do

    shelter_1 = FactoryBot.create(:shelter)

    pet_1 = FactoryBot.create(:pet, shelter: shelter_1)
    pet_2 = FactoryBot.create(:pet, shelter: shelter_1)
    pet_3 = FactoryBot.create(:pet, shelter: shelter_1)
    pet_4 = FactoryBot.create(:pet, shelter: shelter_1)

    application_1 = FactoryBot.create(:application)

    application_pet_1 = FactoryBot.create(:application_pet, application: application_1, pet: pet_1)
    application_pet_1 = FactoryBot.create(:application_pet, application: application_1, pet: pet_2)
    application_pet_1 = FactoryBot.create(:application_pet, application: application_1, pet: pet_3)

    visit "/admin/applications/#{application_1.id}"

    within '#pet-1' do
      click_button("Approve This Pet")
    end

    expect(current_path).to eq("/admin/applications/#{application_1.id}")

    within "#pet-1" do
      expect(page).to_not have_content("Approve This Pet")
      expect(page).to have_content("Approved")
    end

  end

  it 'has a button to approve application for specific pet, which takes user back to admin/application/show page, where the button for that pet is gone and there is an indication that the pet is approved' do

    shelter_1 = FactoryBot.create(:shelter)

    pet_1 = FactoryBot.create(:pet, shelter: shelter_1)
    pet_2 = FactoryBot.create(:pet, shelter: shelter_1)
    pet_3 = FactoryBot.create(:pet, shelter: shelter_1)
    pet_4 = FactoryBot.create(:pet, shelter: shelter_1)

    application_1 = FactoryBot.create(:application)

    application_pet_1 = FactoryBot.create(:application_pet, application: application_1, pet: pet_1)
    application_pet_1 = FactoryBot.create(:application_pet, application: application_1, pet: pet_2)
    application_pet_1 = FactoryBot.create(:application_pet, application: application_1, pet: pet_3)

    visit "/admin/applications/#{application_1.id}"

    within '#pet-1' do
      click_button("Reject This Pet")
    end

    expect(current_path).to eq("/admin/applications/#{application_1.id}")

    within "#pet-1" do
      expect(page).to_not have_content("Reject This Pet")
      expect(page).to have_content("Rejected")
    end

  end


end