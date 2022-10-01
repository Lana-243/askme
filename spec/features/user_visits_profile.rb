require 'rails_helper'

RSpec.feature 'User views a profile', type: :feature do
  given!(:user) { FactoryBot.create(:user) }

  scenario "Anon views user's profile" do
    visit "/users/#{user.nickname}"

    expect(page).to have_current_path "/users/#{user.nickname}"
    expect(page).to have_content user.name
    expect(page).to have_content user.nickname
    expect(page).to have_link 'Let me ask'
    expect(page).to have_content 'This user has no questions yet'
  end

  given(:user_guest) { FactoryBot.create(:user) }

  scenario "User visits somebody else's profile" do
    visit '/session/new'
    fill_in 'Email', with: user_guest.email
    fill_in 'Password', with: user_guest.password
    click_button 'Submit'

    visit "/users/#{user.nickname}"

    expect(page).to have_current_path "/users/#{user.nickname}"
    expect(page).to have_content user.name
    expect(page).to have_content user.nickname
    expect(page).to have_link user_guest.nickname
    expect(page).to have_link 'Let me ask'
    expect(page).to have_content 'This user has no questions yet'
  end

  scenario "User visits own profile" do
    visit '/session/new'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Submit'

    visit "/users/#{user.nickname}"

    expect(page).to have_current_path "/users/#{user.nickname}"

    expect(page).to have_content user.name
    expect(page).to have_content user.nickname
    expect(page).to have_link user.nickname
  end
end
