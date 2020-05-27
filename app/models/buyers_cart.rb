class BuyersCart < ApplicationRecord
    belongs_to :buyer
    has_and_belongs_to_many :items
end
