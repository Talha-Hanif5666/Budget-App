require 'rails_helper'

RSpec.describe 'Transactions', type: :feature do
  before(:all) do
    User.create(name: 'Spice', email: 'capytwo@gmail.com', password: 'Leonileo')
    visit new_user_session_path
    fill_in('Email', with: 'capytwo@gmail.com')
    fill_in('Password', with: 'Leonileo')
    click_button 'Next'
  end

  scenario 'show categories page' do
    sleep(1)
    icon_path = Rails.root.join('spec/fixtures/icons/icon.jpg')
    visit new_category_path
    fill_in('Name', with: 'shopping')
    attach_file('Icon', icon_path)
    click_button 'Save'
    sleep(1)
    find('.card-link').click
    sleep(1)
    assert page.has_content?('Transactions')
  end
end
