class RenameCategoriesBudgetTransactionsToBudgetTransactionsCategories < ActiveRecord::Migration[7.0]
  def change
    rename_table :categories_budget_transactions, :budget_transactions_categories
  end
end
