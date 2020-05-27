class SellersCart < ApplicationRecord
    belongs_to :seller
    has_many :sc_items
    has_many :items, through: :sc_items

    def total_items
        total = 0
    self.items.each do|i|
        total += i.price
        end 
        total
    end

   
end
