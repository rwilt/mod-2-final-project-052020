class Buyer < ApplicationRecord
    has_one :shopping_cart
    has_many :purchases
    has_many :items, through: :purchases
    
    validates :zip, length: { is: 5 }

    has_secure_password

    def uniq_item
        hash = {}
        self.items.each do |item|
            if hash[item] == nil
                hash[item] = 1
            else
                hash[item] += 1
            end
        end
        hash
    end
    
end
