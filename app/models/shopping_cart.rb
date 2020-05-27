class ShoppingCart < ApplicationRecord
    belongs_to :buyer
    has_many :shopping_cart_items
    has_many :items, through: :shopping_cart_items
end
