require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'validation tests' do
    # You cannot create a user twice with the same credentials,
    # hence this code must be run once
    first_user = User.create(name: 'Spice', email: 'testingsthree@gmail.com', password: 'Leonileo')
    before(:each) do
      icon = fixture_file_upload(Rails.root.join('spec/fixtures/icons/icon.jpg'), 'image/jpg')
      first_category = Category.create(name: 'Food', icon:, user_id: first_user.id)
      @transactions = Transaction.create(name: 'mango', amount: 100, author_id: first_user.id,
                                         category_id: first_category.id)
    end

    it 'is is created succefully' do
      expect(@transactions).to be_valid
    end

    it 'is invalid without a name' do
      @transactions.name = nil
      expect(@transactions).to_not be_valid
    end

    it 'is invalid without amount' do
      @transactions.amount = nil
      expect(@transactions).to_not be_valid
    end

    it 'amount must be a number' do
      @transactions.amount = 'house'
      expect(@transactions).to_not be_valid
    end

    it 'must have author ID' do
      @transactions.author_id = nil
      expect(@transactions).to_not be_valid
    end
  end
end
