require 'rails_helper'

RSpec.feature 'User edits profile', type: :feature do
  given(:user) { FactoryBot.create(:user) }

  scenario 'Anon edits users profile' do
    visit "/users/#{user.nickname}/edit"

    expect(page).to have_content "You can't go there!"
  end

  given(:user_guest) { FactoryBot.create(:user) }

  scenario "User edits somebody else's profile" do
    visit '/session/new'
    fill_in 'Email', with: user_guest.email
    fill_in 'Password', with: user_guest.password
    click_button 'Submit'

    visit "/users/#{user.nickname}/edit"

    expect(page).to have_content "You can't go there!"
  end

  scenario "User edits own  profile" do
    visit '/session/new'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Submit'

    visit "/users/#{user.nickname}/edit"

    expect(page).to have_current_path "/users/#{user.nickname}/edit"

    expect(page).to have_content "Name"
    expect(page).to have_content "Nickname"
    expect(page).to have_content "If you do not want to update the password leave it blank!"
    expect(page).to have_content "Password"
    expect(page).to have_content "Password confirmation"
    expect(page).to have_content "Header color"
    expect(page).to have_button "Save"
    expect(page).to have_content "Go back"
    expect(page).to have_content "Delete profile"
  end
end
