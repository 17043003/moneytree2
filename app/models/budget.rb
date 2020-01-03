class Budget < ApplicationRecord
    belongs_to :user
    has_many :categories

    validates :spent_at, presence: true
    validates :amount, presence: true, numericality: {only_integer: true}
end
