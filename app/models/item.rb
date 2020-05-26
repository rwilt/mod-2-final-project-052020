class Item < ApplicationRecord
    has_many :buyers_carts
    has_many :buyers, through: :buyers_carts
    has_many :sellers_carts
    has_many :sellers, through: :sellers_carts
end
