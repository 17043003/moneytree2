class Category < ApplicationRecord
    # has_many :budgets
    belongs_to :budget, optional: true

    validates :kind, presence: true
end
