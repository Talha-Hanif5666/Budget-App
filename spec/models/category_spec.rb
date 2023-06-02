require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validation tests' do
    # You cannot create a user twice with the same credentials,
    # hence this code must be run once
    first_user = User.create(name: 'Spice', email: 'testingstwo@gmail.com', password: 'Leonileo')
    before(:each) do
      icon = fixture_file_upload(Rails.root.join('spec/fixtures/icons/icon.jpg'), 'image/jpg')
      @first_category = Category.create(name: 'Food', icon:, user_id: first_user.id)
    end

    it 'is is created succefully' do
      expect(@first_category).to be_valid
    end

    it 'is invalid without a name' do
      @first_category.name = nil
      expect(@first_category).to_not be_valid
    end

    it 'is invalid without an icon' do
      @first_category.icon = nil
      expect(@first_category).to_not be_valid
    end

    it 'must have a user_id' do
      @first_category.user_id = nil
      expect(@first_category).to_not be_valid
    end
  end
end
