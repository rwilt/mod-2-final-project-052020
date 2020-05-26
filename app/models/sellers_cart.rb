class SellersCart < ApplicationRecord
    belongs_to :item
    belongs_to :seller
end
