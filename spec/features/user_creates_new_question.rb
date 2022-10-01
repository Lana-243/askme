require 'rails_helper'

RSpec.feature 'User creates a new question', type: :feature do
  given!(:user) { FactoryBot.create(:user) }
  given!(:user_guest) { FactoryBot.create(:user) }

  scenario "Anon creates a first question" do
    visit "/users/#{user.nickname}"

    expect(page).to have_current_path "/users/#{user.nickname}"

    expect(page).to have_content 'This user has no questions yet'
    expect(page).to have_link 'Let me ask'

    click_link 'Let me ask'

    expect(page).to have_current_path "/questions/new?nickname=#{user.nickname}"
    expect(page).to have_content "Registration"
    expect(page).to have_link 'Sign in'
    expect(page).to have_content 'New question'
    expect(page).to have_content "for @#{user.nickname}"
    expect(page).to have_content 'Question text'
    expect(page).to have_button 'Save'
  end

  scenario "Registered user creates a first question" do
    visit '/session/new'
    fill_in 'Email', with: user_guest.email
    fill_in 'Password', with: user_guest.password
    click_button 'Submit'

    visit "/users/#{user.nickname}"

    expect(page).to have_current_path "/users/#{user.nickname}"

    expect(page).to have_content 'This user has no questions yet'
    expect(page).to have_link 'Let me ask'

    click_link 'Let me ask'

    expect(page).to have_current_path "/questions/new?nickname=#{user.nickname}"
    expect(page).to have_link "@#{user_guest.nickname}"
    expect(page).to have_content 'New question'
    expect(page).to have_content 'Question text'
    expect(page).to have_button 'Save'
  end
end
