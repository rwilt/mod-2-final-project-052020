class Item < ApplicationRecord
has_and_belongs_to_many :buyers_carts
has_and_belongs_to_many :sellers_carts
end
