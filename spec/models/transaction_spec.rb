require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'transaction Model' do
    before do
      @user = User.new(name: 'Username', email: 'user@gmail.com', password: 'password')
      @transaction = Transaction.new(name: 'transaction', amount: 10, author_id: @user.id)
    end

    it 'is not valid without a name' do
      @transaction.name = nil
      expect(@transaction).to_not be_valid
    end

    it 'is not valid without an amount' do
      @transaction.amount = nil
      expect(@transaction).to_not be_valid
    end

    it 'is not valid with an amount less than 0' do
      @transaction.amount = -1
      expect(@transaction).to_not be_valid
    end

    it 'is not valid without an user' do
      @transaction.author_id = nil
      expect(@transaction).to_not be_valid
    end
  end
end
