class StaticPagesController < ApplicationController

    def root
        if !logged_in? && !logged_in_dev?
          redirect_to login_url
        else
          redirect_to home_url
        end
        
    end
    
end

