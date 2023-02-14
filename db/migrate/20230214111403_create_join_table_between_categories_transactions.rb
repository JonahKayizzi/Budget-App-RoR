class CreateJoinTableBetweenCategoriesTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_transactions, id: false do |t|
      t.belongs_to :category
      t.belongs_to :transaction
    end
  end
end
