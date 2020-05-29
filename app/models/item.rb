class Item < ApplicationRecord
has_many :purchases
has_many :buyers, through: :purchases
has_many :shopping_cart_items
has_many :shopping_carts, through: :shopping_cart_items


end
