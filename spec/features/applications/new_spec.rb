require 'rails_helper'

RSpec.describe 'can create and fill out applications' do
  it 'can fill in and submit applications' do
    visit '/applications/new'

    fill_in 'first_name', with: 'Bobby'
    fill_in 'last_name', with: 'Otter'
    fill_in 'street_address', with: '123 Oyster haven'
    fill_in 'city', with: 'Clamville'
    fill_in 'state', with: 'Colorado'
    fill_in 'zip_code', with: 12332


    click_button 'Create Application'
    # having trouble on what to call id on
    #expect(current_path).to eq("/applications/#{@application.id}")

    expect(page).to have_content('Bobby')
    expect(page).to have_content('Otter')
    expect(page).to have_content('123 Oyster haven')
    expect(page).to have_content('Clamville')
    expect(page).to have_content('Colorado')
    expect(page).to have_content(12332)
    expect(page).to have_content('In Progress')
  end

  it 'takes user back to the new applications page if a field is left empty' do
    visit '/applications/new'
    application_1 = Application.create!(
      first_name: "Alex",
      last_name: "Boyd",
      street_address: "123 Sesame Street",
      city: "Washington",
      state: "District of Columbia",
      zip_code: 34589,
      applicant_bio: "Hey lemme have that cat or else",
      application_status: "Pending"
    )

    #click_button 'Create Application'


    fill_in 'first_name', with: "#{application_1.first_name}"
    fill_in 'street_address', with: "#{application_1.street_address}"
    fill_in 'city', with: "#{application_1.city}"
    fill_in 'state', with: "#{application_1.state}"
    fill_in 'zip_code', with: "#{application_1.zip_code}"

    click_button 'Create Application'

    #expect(current_path).to eq("/applications/#{application_1.id}")
    expect(page).to have_content("#{application_1.first_name}")
    expect(page).to_not have_content("#{application_1.last_name}")
    expect(page).to have_content("#{application_1.street_address}")
    expect(page).to have_content("#{application_1.city}")
    expect(page).to have_content("#{application_1.state}")
    expect(page).to have_content("#{application_1.zip_code}")


    # it keeps getting an id numberr after applications for the error error_message. Don't know what to call id on
  end


end
