class BuyersController < ApplicationController
    before_action :find_buyer, only: [:show, :edit, :update, :destroy]


    def index
        @buyers = Buyer.all
    end

    def show
    end
    
    def new
        @buyer = Buyer.new
    end
    
    def create
        @buyer = Buyer.create(buyer_params)

        if @buyer.valid?
            redirect_to buyer_path(@buyer)
        else
            flash[:errors] = @buyer.errors.full_messages
            redirect_to new_buyer_path
        end
    end
    
    def edit
    end
    
    def update

        if @buyer.update(buyer_params)
            redirect_to buyer_path(@buyer)
        else
            flash[:errors] = @buyer.errors.full_messages
            redirect_to edit_buyer_path
        end
    end
    
    def destroy
        @buyer.destroy
        redirect_to buyers_path
    end


    private

    def buyer_params
        params.require(:buyer).permit(:name, :phone, :zip, :email)
    end

    def find_buyer
        @buyer = Buyer.find(params[:id])
    end

end
