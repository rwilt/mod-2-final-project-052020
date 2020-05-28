class ApplicationController < ActionController::Base
    before_action :set_user
    before_action :authorized

    def set_user
        @logged_in_buyer = Buyer.find_by(id: session[:buyer_id])
    end

    def authorized
        if @logged_in_buyer
        else
            flash[:errors] = "Please login"
            redirect_to new_login_path
        end
    end
end
