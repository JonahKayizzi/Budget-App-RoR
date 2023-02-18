class BudgetTransaction < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_and_belongs_to_many :categories, foreign_key: 'budget_transaction_id'

  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :categories, presence: true
end
