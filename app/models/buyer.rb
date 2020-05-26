class Buyer < ApplicationRecord
    has_many :buyers_carts
    has_many :items, through: :buyers_carts

    validates :zip, length: { is: 5 }
end
