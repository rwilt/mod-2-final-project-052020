class BuyersCartsController < ApplicationController
    before_action :find_buyerscart, only: [:show, :edit, :update, :destroy] 

    def show
    end
    
    def new
        @buyerscart = BuyersCart.new
        @buyers = Buyer.all
        @items = Item.all
    end
    
    def create
        @buyerscart = BuyersCart.create(buyerscart_params)

        if @buyerscart.valid?
            redirect_to buyers_cart_path(@buyerscart)
        else
            flash[:errors] = @buyerscart.errors.full_messages
            redirect_to new_buyers_cart_path
        end
    end
    
    def edit
        @buyers = Buyer.all
        @items = Item.all
    end
    
    def update

        if @buyerscart.update(buyerscart_params)
            redirect_to buyers_cart_path(@buyerscart)
        else
            flash[:errors] = @buyerscart.errors.full_messages
            redirect_to edit_buyers_cart_path(@buyerscart)
        end
    end
    
    def destroy
        @buyerscart.destroy
    
    end

    
    private
    def buyerscart_params
        params.require(:buyerscart).permit(:buyer_id, :item_id)
    end

    def find_buyerscart
        @buyerscart = BuyersCart.find(params[:id])
    end

end
