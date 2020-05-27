class BuyersCart < ApplicationRecord
    belongs_to :buyer
    has_many :bc_items
    has_many :items, through: :bc_items
end
