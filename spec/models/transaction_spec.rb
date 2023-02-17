require 'rails_helper'

RSpec.describe BudgetTransaction, type: :model do
    before :each do
        @user = User.create(name: 'Jonah', email: 'jonakayizzi@gmail.com', password: '123456')

        @category = Category.create(name:'Microverse', icon:'microverser.png', user: @user)

        @transaction = BudgetTransaction.create(name:'Microverse Transaction', amount: 100, user: @user)

        @transaction.categories << @category
    end

    context 'validation tests' do
        it 'is valid with attributes' do
            expect(@transaction).to be_valid
        end

        it 'name must be present' do
            @transaction.name = nil
            expect(@transaction).to_not be_valid
        end

        it 'amount must be present' do
            @transaction.amount = nil
            expect(@transaction).to_not be_valid
        end

        it 'category must be present' do
            @transaction.categories = []
            expect(@transaction).to_not be_valid
        end
    end
end
