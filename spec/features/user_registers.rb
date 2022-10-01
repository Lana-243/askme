require 'rails_helper'

RSpec.feature 'User registers', type: :feature do
  scenario 'user signs up from the main page' do
    visit '/'
    click_link 'Registration'
    fill_in 'Your name', with: 'User_1'
    fill_in 'Nickname', with: 'user1'
    fill_in 'Email', with: 'user@user.com'
    fill_in 'Password', with: '111111'
    fill_in 'Password confirmation', with: '111111'
    click_button 'Register'

    expect(page).to have_current_path '/'
    expect(page).to have_content 'You have successfully registered'
    expect(page).to have_content 'Sign out'

    expect(page).not_to have_content 'Registration'
    expect(page).not_to have_content 'Sign in'
    # save_and_open_page
  end
end
