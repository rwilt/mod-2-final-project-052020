class ItemsController < ApplicationController
    before_action :find_item, only: [:show, :edit, :update, :destroy, :add_to_cart]
    # skip_before_action :authorized

    def index
        @items = Item.all
    end
        
    def show
    end
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.create(item_params)

        if @item.valid?
            
            redirect_to item_path(@item)
        else
            flash[:errors] = @item.errors.full_messages

            redirect_to new_item_path
        end
    end
    
    def edit
    end
    
    def update
    
        if @item.update(item_params)

            redirect_to item_path(@item)
        else
            flash[:errors] = @item.errors.full_messages

            redirect_to edit_item_path(@item)
        end
    end

    def destroy
        @item.destroy
        
        redirect_to items_path
    end

    def add_to_cart
        @shopping_cart = ShoppingCart.find_by(buyer_id: @logged_in_buyer)
        unless params[:quantity].blank?
        quantity = params[:quantity].to_i 
            quantity.times do 
                ShoppingCartItem.create(shopping_cart_id: @shopping_cart.id, item_id: @item.id)
                flash[:success] = "Added to Cart!"
            end
            redirect_to shopping_cart_path(@shopping_cart.id)
        end 
    end
    
    def destroy
    
    end


    
    private

    def item_params
        params.require(:item).permit(:name, :price, :description, :photo)
    end

    def find_item
        @item = Item.find(params[:id])
    end


end
