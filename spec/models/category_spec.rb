require 'rails_helper'

RSpec.describe Category, type: :model do
    before :each do
        @user = User.create(name: 'Jonah', email: 'jonakayizzi@gmail.com', password: '123456', password_confirmation: '123456')
        @category = Category.create(name:'Microverse', icon:'microverser.png', user: @user)
    end
    
    context 'validation tests' do
        it 'is valid with attributes' do
            expect(@category).to be_valid
        end

        it 'name must be present' do
            @category.name = nil
            expect(@category).to_not be_valid
        end

        it 'icon must be present' do
            @category.icon = nil
            expect(@category).to_not be_valid
        end
    end
end