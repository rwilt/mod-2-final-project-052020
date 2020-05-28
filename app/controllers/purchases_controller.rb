class PurchasesController < ApplicationController


    def review
        @buyerscart = ShoppingCart.find_by(buyer_id: @logged_in_buyer.id)
    end

    def checkout
        @buyerscart = ShoppingCart.find_by(buyer_id: @logged_in_buyer.id)
        @buyerscart.items.each do |x|
            Purchase.create(buyer_id: @logged_in_buyer.id, item_id: x.id)
        end
        @buyerscart.items = []

        redirect_to buyer_path(@logged_in_buyer)
    end
    

    def confirmation_page
    end

end
