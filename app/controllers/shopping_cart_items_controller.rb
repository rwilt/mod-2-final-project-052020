class ShoppingCartItemsController < ApplicationController
    before_action :find_shoppingcartitem, only: [:show, :edit, :update, :destroy]

    def index
        @shoppingcartitems = ShoppingCartItems.all
    end

    def show
    end
    
    def new
        @shoppingcartitem = ShoppingCartItem.new
        @shoppingcart = ShoppingCart.all
        @items = Item.all
    end
    
    def create
        @shoppingcartitem = ShoppingCartItem.create(shoppingcartitem_params)

        if @shoppingcartitem.valid?
            redirect_to shopping_cart_path(@shoppingcartitem.buyers_cart)
        else
            flash[:errors] = @shoppingcartitem.errors.full_messages
            redirect_to new_shopping_cart_item_path
        end
    end
    
    def edit
        @shoppingcarts = ShoppingCart.all
        @items = Item.all
    end
    
    def update
    
        if @shoppingcartitem.update(shoppingcartitem_params)
            redirect_to shopping_cart_path(@shoppingcartitem.shopping_cart)
        else
            flash[:errors] = @shoppingcartitem.errors.full_messages
            redirect_to edit_shopping_cart_path(@shoppingcartitem)
        end
    end
    
    def destroy
    
    end


    private

    def shoppingcartitem_params
        params.require(:bc_item).permit(:buyers_cart_id, :item_id)
    end

    def find_shoppingcartitem
        @shoppingcartitem = ShoppingCartItem.find(params[:id])
    end
end
