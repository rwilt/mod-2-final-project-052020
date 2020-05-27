class Buyer < ApplicationRecord
    has_one :buyers_cart
    validates :zip, length: { is: 5 }
end
