class Category < ApplicationRecord
    # has_many :budgets
    belongs_to :budget

    validates :kind, presence: true
end
