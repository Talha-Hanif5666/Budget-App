require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  scenario 'show home page' do
    visit root_path
    assert page.has_content?('transaction-buddy')
  end

  scenario 'user can sign up' do
    visit new_user_registration_path
    fill_in('Email', with: 'leehaney@gmail.com')
    fill_in('Name', with: 'Leehaney')
    fill_in('Password', with: 'Leonileo')
    fill_in('Password_confirmation', with: 'Leonileo')
    click_button 'Next'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'show sign-in page' do
    User.create(name: 'Spice', email: 'capyone@gmail.com', password: 'Leonileo')
    visit new_user_session_path
    fill_in('Email', with: 'testingsone@gmail.com')
    fill_in('Password', with: 'Leonileo')
    click_button 'Next'
    expect(page).to have_content 'Signed in successfully.'
  end
end
