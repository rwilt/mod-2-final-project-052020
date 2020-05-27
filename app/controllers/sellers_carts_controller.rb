class SellersCartsController < ApplicationController

    def show
        @sellerscart = SellersCart.find(params[:id])
    end
end
