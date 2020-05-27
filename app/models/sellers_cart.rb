class SellersCart < ApplicationRecord
    belongs_to :seller
    has_and_belongs_to_many :items
end
