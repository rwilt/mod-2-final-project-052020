class HomeController < ApplicationController

    skip_before_action :authorized, only: [:welcome]

    def welcome
        @items = Item.all
    end


end