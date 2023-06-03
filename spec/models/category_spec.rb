require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validation tests' do
    let(:user) { User.create(name: 'Spice', email: 'testingstwo@gmail.com', password: 'Leonileo') }

    it 'is created successfully' do
      category = Category.new(name: 'Food', icon: fixture_file_upload(Rails.root.join('spec/fixtures/icons/icon.jpg'), 'image/jpg'), user: user)
      expect(category).to be_valid
    end

    it 'is invalid without a name' do
      category = Category.new(name: nil, icon: fixture_file_upload(Rails.root.join('spec/fixtures/icons/icon.jpg'), 'image/jpg'), user: user)
      expect(category).to_not be_valid
    end

    it 'is invalid without an icon' do
      category = Category.new(name: 'Food', icon: nil, user: user)
      expect(category).to_not be_valid
    end

    it 'must have a user' do
      category = Category.new(name: 'Food', icon: fixture_file_upload(Rails.root.join('spec/fixtures/icons/icon.jpg'), 'image/jpg'), user: nil)
      expect(category).to_not be_valid
    end
  end
end
