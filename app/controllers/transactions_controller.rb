class TransactionsController < ApplicationController
  def new
    @current_category = Category.find(params[:category_id])
    new_transaction = BudgetTransaction.new
    respond_to do |format|
      format.html { render :new, locals: { transaction: new_transaction, current_category: @current_category } }
    end
  end

  def create
    @current_category = Category.find(params[:category_id])
    transaction_params = params.require(:budget_transaction).permit(:name, :amount, category_ids: [])
    transaction = BudgetTransaction.new(transaction_params)
    transaction.user = current_user
    selected_categories = Category.find(transaction_params[:category_ids].reject(&:empty?))
    selected_categories.each do |category|
      transaction.categories << category unless transaction.categories.include?(category)
    end
    respond_to do |format|
      format.html do
        if transaction.save
          flash[:notice] = 'Transaction created successfully'
          redirect_to category_path(@current_category)
        else
          flash.now[:alert] = 'Transaction could not be created'
          render :new, locals: { transaction: transaction, current_category: @current_category }
        end
      end
    end
  end
end
