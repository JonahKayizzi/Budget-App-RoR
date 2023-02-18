require 'rails_helper'

RSpec.describe 'Categorys', type: :feature do
  before :each do
    @user = User.create(name: 'Jonah', email: 'jonakayizzi@gmail.com', password: '123456',
                        password_confirmation: '123456')
    @category = Category.create(name: 'Microverse', icon: 'microverser.png', user: @user)

    sign_in(@user)
    visit categories_path
  end

  describe 'the category index page' do
    it 'displays the category name' do
      expect(page).to have_content(@category.name)
    end

    it 'displays the category icon' do
      expect(page).to have_css("img[  src='#{@category.icon}']")
    end

    it 'displays the category total' do
      expect(page).to have_content(@category.budget_transactions.sum(:amount))
    end

    it 'displays button to add a transaction' do
      expect(page).to have_link('NEW CATEGORY')
    end
  end
end
