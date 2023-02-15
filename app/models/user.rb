class User < ApplicationRecord
    has_many :categories, foreign_key: 'user_id'
    has_many :budget_transactions, foreign_key: 'user_id'

    validates :name, presence: true, length: { minimum: 3, maximum: 250 }
end