require 'rails_helper'

RSpec.describe 'the admin shelter index' do
  it 'lists all the shelter names in reverse alphabetical order' do
    @shelter_c = Shelter.create(name: 'C - Test', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_d = Shelter.create(name: 'D - Test', city: 'Harlingen, TX', foster_program: false, rank: 5)
    @shelter_a = Shelter.create(name: 'A - Test', city: 'Denver, CO', foster_program: true, rank: 10)
    @shelter_b = Shelter.create(name: 'B - Test', city: 'Denver, CO', foster_program: true, rank: 10)

    visit '/admin/shelters'

    expect(@shelter_d.name).to appear_before(@shelter_c.name)

    expect(@shelter_c.name).to appear_before(@shelter_b.name)

    expect(@shelter_b.name).to appear_before(@shelter_a.name)

    expect(page).to have_content(@shelter_a.name)
  end

  it 'has section showing name of all shelters with at least one pending application' do

    @shelter_a = Shelter.create(name: 'A - Test', city: 'Denver, CO', foster_program: true, rank: 10)
    @shelter_b = Shelter.create(name: 'B - Test', city: 'Denver, CO', foster_program: true, rank: 10)
    @shelter_c = Shelter.create(name: 'C - Test', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_d = Shelter.create(name: 'D - Test', city: 'Harlingen, TX', foster_program: false, rank: 5)

    @pet_1 = FactoryBot.create(:pet, shelter: @shelter_a)
    @pet_2 = FactoryBot.create(:pet, shelter: @shelter_b)
    @pet_3 = FactoryBot.create(:pet, shelter: @shelter_c)

    @application_1 = FactoryBot.create(:application,application_status: "Pending")

    @application_pet_1 = FactoryBot.create(:application_pet, application: @application_1, pet: @pet_1)

    @application_2 = FactoryBot.create(:application, application_status: "In Progress")

    @application_pet_2 = FactoryBot.create(:application_pet, application: @application_2, pet: @pet_2)

    @application_3 = FactoryBot.create(:application, application_status: "Rejected")

    @application_pet_3 = FactoryBot.create(:application_pet, application: @application_3, pet: @pet_3)

    visit '/admin/shelters'

    expect(page).to have_content("Shelters With Pending Applications")

    within "#shelters-with-pending-apps" do
      expect(page).to have_content(@shelter_a.name)
      expect(page).to_not have_content(@shelter_b.name)
      expect(page).to_not have_content(@shelter_c.name)
      expect(page).to_not have_content(@shelter_d.name)
    end

  end
end