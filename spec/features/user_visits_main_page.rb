require 'rails_helper'

RSpec.feature 'User visits main page', type: :feature do
  before :each do
    FactoryBot.create_list(:question, 5)
    FactoryBot.create_list(:question_without_user, 3)
  end

  scenario 'shows page for anon' do
    visit '/'

    expect(page).to have_current_path '/'

    expect(page).to have_content 'Registration'
    expect(page).to have_content 'Sign in'

    expect(page).to have_content 'Recently added'
    expect(page).to have_content 'Hashtags'
    expect(page).to have_content 'Last Questions'

    expect(page).to have_content 'for user'
  end

  given(:user) { FactoryBot.create(:user) }

  scenario 'shows page for signed-in user' do
    visit '/session/new'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Submit'

    expect(page).to have_current_path '/'

    expect(page).not_to have_content 'Registration'
    expect(page).not_to have_content 'Sign in'
    expect(page).to have_content 'You are in!'
    expect(page).to have_content 'Sign out'
    expect(page).to have_content "@#{user.nickname}"

    expect(page).to have_content 'Recently added'
    expect(page).to have_content 'Hashtags'
    expect(page).to have_content 'Last Questions'
    expect(page).to have_content 'for user'
  end
end
