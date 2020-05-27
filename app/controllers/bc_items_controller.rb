class BcItemsController < ApplicationController
    before_action :find_bc_item, only: [:show, :edit, :update, :destroy]

    def index
        @bcitems = BcItem.all
    end

    def show
    end
    
    def new
        @bcitem = BcItem.new
        @buyerscarts = BuyersCart.all
        @items = Item.all
    end
    
    def create
        @bcitem = BcItem.create(bcitem_params)

        if @bcitem.valid?
            redirect_to buyers_cart_path(@bcitem.buyerscart)
        else
            flash[:errors] = @bcitem.errors.full_messages
            redirect_to new_bc_item_path
        end
    end
    
    def edit
        @buyerscarts = BuyersCart.all
        @items = Item.all
    end
    
    def update
    
        if @bcitem.update(bc_item_params)
            redirect_to buyers_cart_path(@bcitem.buyerscart)
        else
            flash[:errors] = @bcitem.errors.full_messages
            redirect_to edit_bc_item_path
        end
    end
    
    def destroy
    
    end
end
