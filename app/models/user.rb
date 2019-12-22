class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
    validates :email, presence: true, email: true

    attr_accessor :current_password
    validates :password, presence: { if: :current_password }
end
