class ShoppingCartsController < ApplicationController
    before_action :find_shoppingcart, only: [:show, :edit, :update, :destroy]

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
    
    def edit
    end
    
    def update
        
        if @shoppingcart.update(shoppingcart_params)
            redirect_to shopping_cart_path(@shoppingcart)
        else
            flash[:errors] = @shoppingcart.errors.full_messages
            redirect_to edit_shopping_cart
        end
    end
    
    def destroy
        @shoppingcart.destroy
        redirect_to shopping_carts_path
    end


    private
    def shoppingcart_params
        params.require(:shopping_cart)
    end

    def find_shoppingcart
        @buyerscart = ShoppingCart.find(params[:id])
    end

end
