class Budget < ApplicationRecord
    belongs_to :user
    has_many :expenses, dependent: :destroy
    has_many :categories, through: :expenses

    validates :spent_at, presence: true
    validates :amount, presence: true, numericality: {only_integer: true}
end
