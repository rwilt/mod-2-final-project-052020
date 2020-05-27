class SellersCartsController < ApplicationController

    def show
        @scitem = ScItem.all
        @item = Item.all
        @sellerscart = SellersCart.find(params[:id])
    end

 
end
