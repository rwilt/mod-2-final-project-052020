class SellersCart < ApplicationRecord
    belongs_to :seller
    has_many :sc_items
    has_many :items, through: :sc_items
end
