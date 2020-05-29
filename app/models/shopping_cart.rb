class ShoppingCart < ApplicationRecord
    belongs_to :buyer
    has_many :shopping_cart_items
    has_many :items, through: :shopping_cart_items

    def cart_total
        total = 0
        self.items.each do |x|
            total += 1
        end
        total
    end

    def subtotal
        cost = 0
        self.items.each do |x|
            cost += x.price
        end
        cost
    end

    def list_items
        counter = 0
        self.items.uniq.each do |x|
            puts "Name: #{x.name} $#{x.price}"
        end
    end

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

    def change_item_quantity(item_id, quantity)
        join_class_arr = ShoppingCartItem.where("item_id = ? and shopping_cart_id = ?", item_id, self.id)
        join_class_arr.each do |join_class|
            join_class.destroy
        end
        quantity.times do 
            ShoppingCartItem.create(item_id: item_id, shopping_cart_id: self.id)
        end
    end

    def delete_item(item_id)
        item = ShoppingCartItem.where("item_id = ? and shopping_cart_id = ?", item_id, self.id)
        item.each do |x|
            x.destroy
        end
    end


end
