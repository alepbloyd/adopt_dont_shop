require 'rails_helper'

RSpec.describe 'the admin shelter index' do
  it 'lists all the shelter names in reverse alphabetical order' do
    @shelter_1 = Shelter.create(name: 'C - Test', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_2 = Shelter.create(name: 'D - Test', city: 'Harlingen, TX', foster_program: false, rank: 5)
    @shelter_3 = Shelter.create(name: 'A - Test', city: 'Denver, CO', foster_program: true, rank: 10)
    @shelter_4 = Shelter.create(name: 'B - Test', city: 'Denver, CO', foster_program: true, rank: 10)

    visit '/admin/shelters'

    expect(@shelter_3.name).to appear_before(@shelter_4.name)

    expect(@shelter_4.name).to appear_before(@shelter_1.name)

    expect(@shelter_1.name).to appear_before(@shelter_2.name)

    expect(page).to have_content(@shelter_2.name)
  end
end