class Buyer < ApplicationRecord
    has_one :shopping_cart
    has_many :purchases
    has_many :items, through: :purchases
    
    validates :zip, length: { is: 5 }

    has_secure_password

    
end
