class HomeController < ApplicationController

    skip_before_action :authorized, only: [:welcome]

    def welcome
        @items = Item.all
    end

    def log_in
    end

    def check_log_in
    end

    def log_out
    end

end