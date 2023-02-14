class User < ApplicationRecord
    has_many :categories, foreign_key: 'user_id'
    has_many :transactions, foreign_key: 'user_id'

    validates :name, presence: true, length: { minimum: 3, maximum: 250 }
end