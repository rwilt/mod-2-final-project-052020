class SellersController < ApplicationController
#####notes##### 
#add in before actions to clean up code
#what kind of validations are we going to need for all of our models? 

    def index
        @sellers = Seller.all
    end
        
    def show
        @seller = Seller.find(params[:id])
    end

    def new
        @seller = Seller.new
    end
    
    def create
        @seller = Seller.create(seller_params)
        redirect_to seller_path(@seller.id)  
    end
    
    def edit
        @seller = Seller.find(params[:id])
    end
    
    def update
        @seller = Seller.find(params[:id])
        @seller = Seller.update(seller_params)
        redirect_to seller_path(@seller.id)  
    end

    
    def destroy
    
    end

    private

    def seller_params
        params.require(:seller).permit(:name,:bio,:phone,:email,:zip,:photo)
    end

end
