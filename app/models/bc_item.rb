class BcItem < ApplicationRecord
    belongs_to :buyers_cart
    belongs_to :item
end
