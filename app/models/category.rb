class Category < ApplicationRecord
    validates :kind, presence: true
end
