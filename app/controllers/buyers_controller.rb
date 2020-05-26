class BuyersController < ApplicationController


    def index
        @buyers = Buyer.all
    end

    def show
        @buyer = Buyer.find(params[:id])
    end
    
    def new
        
    end
    
    def create
    
    end
    
    def edit
    
    end
    
    def update
    
    end
    
    def destroy
    
    end

end
