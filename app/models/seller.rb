class Seller < ApplicationRecord
    has_many :sellers_carts
    has_many :items, through: :sellers_carts
end
