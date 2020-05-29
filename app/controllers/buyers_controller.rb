class BuyersController < ApplicationController
    skip_before_action :authorized, only: [:create, :new]
    before_action :find_buyer, only: [:show, :edit, :update, :destroy]

    def show

        if @buyer == @logged_in_buyer
            render :show
        else
            redirect_to buyers_path
        end
    end
    
    def new
        @buyer = Buyer.new
    end
    
    def create
        @buyer = Buyer.create(buyer_params)

        if @buyer.valid?
            flash[:success] = "Success! Start Shopping!"
            ShoppingCart.create(buyer_id: @buyer.id)
            session[:buyer_id] = @buyer.id  
            redirect_to buyer_path(@buyer.id)
        else
            flash[:errors] = @buyer.errors.full_messages
            redirect_to new_buyer_path
        end
    end
    
    def edit
    end
    
    def update

        if @buyer.update(buyer_params)
            redirect_to buyer_path(@buyer.id)
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
        params.require(:buyer).permit(:name, :phone, :zip, :email, :username, :password)
    end

    def find_buyer
        @buyer = Buyer.find(params[:id])
    end

end
