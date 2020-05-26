class SellersCartsController < ApplicationController
    before_action :find_sellerscart, only: [:show, :edit, :update, :destroy] 

    def show
    end
    
    def new
        @sellerscart = SellersCart.new
        @sellers = Seller.all
        @items = Item.all
    end
    
    def create
        @sellerscart = SellersCart.create(sellerscart_params)

        if @sellerscart.valid?
            redirect_to sellers_cart_path(@sellerscart)
        else
            flash[:errors] = @sellerscart.errors.full_messages
            redirect_to new_sellers_cart_path
        end
    end
    
    def edit
        @sellers = Seller.all
        @items = Item.all
    end
    
    def update

        if @sellerscart.update(buyerscart_params)
            redirect_to sellers_cart_path(@sellerscart)
        else
            flash[:errors] = @sellerscart.errors.full_messages
            redirect_to edit_sellers_cart(@sellerscart)
        end
    end
    
    def destroy
        @sellerscart.destroy
    
    end

    
    private
    def sellerscart_params
        params.require(:sellerscart).permit(:seller_id, :item_id)
    end

    def find_sellerscart
        @sellerscart = SellersCart.find(params[:id])
    end

end
