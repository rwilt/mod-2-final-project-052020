class ScItemsController < ApplicationController
    
    def new
    @scitem = ScItem.new
    end
    
    def create
 
    @scitem = ScItem.new
    @scitem = ScItem.create(sc_params)
    redirect_to new_sc_item_path

    end
    
    def edit
    
    end
    
    def update
    
    end
    
    def show
    
    end
    
    def destroy
    
    end

    private
    def sc_params
        params.require(:sc_item).permit(:sellers_cart_id,:item_id)
    end
end
