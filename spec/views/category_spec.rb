require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  before(:each) do
    User.create(name: 'Spice', email: 'capytwo@gmail.com', password: 'Leonileo')
    visit new_user_session_path
    fill_in('Email', with: 'capytwo@gmail.com')
    fill_in('Password', with: 'Leonileo')
    click_button 'Next'
  end

  scenario 'show categories page' do
    sleep(1)
    visit categories_path
    assert page.has_content?('Categories')
  end

  scenario 'create new category' do
    sleep(1)
    icon_path = Rails.root.join('spec/fixtures/icons/icon.jpg')
    visit new_category_path
    fill_in('Name', with: 'shopping')
    attach_file('Icon', icon_path)
    click_button 'Save'
    assert page.has_content?('Category was successfully created.')
  end
end
