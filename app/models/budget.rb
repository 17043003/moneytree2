class Budget < ApplicationRecord
    validates :spent_at, presence: true, uniqueness: true
    validates :amount, presence: true, numericality: {only_integer: true}
end
