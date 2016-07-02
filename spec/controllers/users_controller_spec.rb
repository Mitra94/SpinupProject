require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    
    describe "redirect_to login" do
    
        it "redirect_to login if not logged in" do
            get :index
            expect(response).to redirect_to('/login') 
        end

    end
    
end
