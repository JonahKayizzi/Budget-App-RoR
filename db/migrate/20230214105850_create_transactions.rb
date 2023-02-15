class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :budget_transactions do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
