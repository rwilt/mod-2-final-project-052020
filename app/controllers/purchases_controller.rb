class PurchasesController < ApplicationController


    def review
        @shoppingcart = ShoppingCart.find_by(buyer_id: @logged_in_buyer.id)
    end

    def checkout
        @shoppingcart = ShoppingCart.find_by(buyer_id: @logged_in_buyer.id)
        @shoppingcart.items.each do |x|
            Purchase.create(buyer_id: @logged_in_buyer.id, item_id: x.id)
        end
        @shoppingcart.items = []

        redirect_to buyer_path(@logged_in_buyer)
    end
    

    def confirmation_page
    end

end
