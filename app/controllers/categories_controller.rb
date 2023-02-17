class CategoriesController < ApplicationController
  include CategoriesHelper
  def index
    @categories = Category.all
  end

  def new
    new_category = Category.new
    respond_to do |format|
      format.html { render :new, locals: { category: new_category } }
    end
  end

  def create
    category_params = params.require(:category).permit(:name, :icon)
    category = Category.new(category_params)
    category.user = current_user
    respond_to do |format|
      format.html do
        if category.save
          flash[:notice] = 'Category created successfully'
          redirect_to categories_path
        else
          flash.now[:alert] = 'Category could not be created'
          render :new, locals: { category: category }
        end
      end
    end
  end

  def show
    @category = Category.find(params[:id])
    @transactions = @category.budget_transactions.order(created_at: :desc)
    @total = category_total(@category)
  end
end
