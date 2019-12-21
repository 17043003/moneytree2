class User < ApplicationRecord

    validates :name, presence: true, length: { maximum: 20 }
    validates :email, presence: true, uniqueness: true, email: true
end
