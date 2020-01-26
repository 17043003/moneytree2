class User < ApplicationRecord
    has_secure_password

    has_many :budgets, dependent: :destroy

    validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
    validates :email, presence: true, email: true, uniqueness: true

    attr_accessor :current_password
    validates :password, presence: { if: :current_password }
end
