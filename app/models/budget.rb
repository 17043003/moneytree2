class Budget < ApplicationRecord
    belongs_to :user

    validates :spent_at, presence: true
    validates :amount, presence: true, numericality: {only_integer: true}

    scope :readable, ->(user) { where(user_id: user.id)}
end
