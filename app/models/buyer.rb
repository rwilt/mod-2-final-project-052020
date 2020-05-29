class Buyer < ApplicationRecord
    has_one :shopping_cart
    has_many :purchases
    has_many :items, through: :purchases
    
    validates :zip, length: { is: 5 }
    validates :username, uniqueness: true
    validates :name, :username, :email, :phone, :zip, presence: true

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

    def suggest_items
    ids = ShoppingCartItem.all.collect do |item|
        item.item_id
    end
    ids.collect do |id|
     Item.find_by(id:id).id
    end.uniq.sample(3)
    end
    
end
