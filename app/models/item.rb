class Item < ApplicationRecord
has_many :purchases
has_many :buyers, through: :purchases
has_many :shopping_cart_items
has_many :shopping_carts, through: :shopping_cart_items


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
