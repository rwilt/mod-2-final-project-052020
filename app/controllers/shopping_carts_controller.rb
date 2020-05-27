class ShoppingCartsController < ApplicationController
    before_action :find_buyerscart, only: [:show, :edit, :update, :destroy]

    def index
        @buyerscarts = BuyersCart.all
    end

    def show
    end
    
    def new
        @buyerscart = BuyersCart.new
    end
    
    def create
        @buyerscart = BuyersCart.create(buyers_carts_params)

        if @buyerscart.valid?
            redirect_to buyers_cart_path(@buyerscart)
        else
            flash[:errors] = @buyerscart.errors.full_messages
            redirect_to new_buyers_cart_path
        end
    end
    
    def edit
    end
    
    def update
        
        if @buyerscart.update
            redirect_to buyers_cart_path(@buyerscart)
        else
            flash[:errors] = @buyerscart.errors.full_messages
            redirect_to edit_buyers_cart_path
        end
    end
    
    def destroy
        @buyerscart.destroy
        redirect_to buyers_carts_path
    end


    private
    def buyers_carts_params
        params.require(:buyers_cart).permit(:buyer_id)
    end

    def find_buyerscart
        @buyerscart = BuyersCart.find(params[:id])
    end

end
