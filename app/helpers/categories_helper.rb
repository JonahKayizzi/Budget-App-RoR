module CategoriesHelper
  def category_total(category)
    category.budget_transactions.sum(:amount)
  end
end
