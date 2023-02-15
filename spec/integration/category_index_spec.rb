require 'rails_helper'

RSpec.describe 'Categorys index page', type: :feature do
    before :each do
        @user = User.create(name: 'Microverse')
        @category = Category.create(name:'Microverse', icon:'microverser.png', user: @user)
    
        sign_in @user
        visit categories_path
    end
end