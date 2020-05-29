class ShoppingCartsController < ApplicationController

    def show
        @shoppingcart = ShoppingCart.find(params[:id])
    end
    
end
