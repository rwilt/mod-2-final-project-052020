class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]

    def create
        buyer = Buyer.find_by(username: session_params[:username])

        if buyer && buyer.authenticate(session_params[:password])
            session[:buyer_id] = buyer.id
            redirect_to buyer
        else
            flash[:error] = "Sorry try again."
            redirect_to new_login_path
        end
    end

    def destroy
        session[:buyer_id] = nil
        redirect_to home_path
    end


    private
    def session_params
        params.require(:session).permit(:username, :password)
    end


end
