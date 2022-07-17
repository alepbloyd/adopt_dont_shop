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
end