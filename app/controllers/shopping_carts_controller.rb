class ShoppingCartsController < ApplicationController
    before_action :find_shoppingcart, only: [:show, :update, :destroy]

    def index
        @shoppingcarts = ShoppingCart.all
    end

    def show
    end
    
    def new
        @shoppingcart = ShoppingCart.new
    end
    
    def create
        @shoppingcart = ShoppingCart.create(shoppingcart_params)

        if @shoppingcart.valid?
            redirect_to shopping_cart_path(@shoppingcart)
        else
            flash[:errors] = @shoppingcart.errors.full_messages
            redirect_to new_shopping_cart_path
        end
    end
    
    def update
        quantity = params[:quantity].to_i
        @shoppingcart.change_item_quantity(params[:item_id], quantity)

        redirect_to @shoppingcart
    end
    
    def destroy
        @shoppingcart.delete_item(params[:item_id])

        redirect_to shopping_cart_path(@shoppingcart)
    end


    private
    def shoppingcart_params
        params.require(:shopping_cart).permit
    end

    def find_shoppingcart
        @shoppingcart = ShoppingCart.find(params[:id])
    end

end
