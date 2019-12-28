class Category < ApplicationRecord
    has_many :expenses, dependent: :destroy
    has_many :budgets, through: :expenses

    validates :kind, presence: true
end
