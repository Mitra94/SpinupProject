require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

    describe "login" do
        
        it "should be logged in" do
            visit "/signup/user"
            fill_in "Username", :with => "tonno"
            fill_in "Email", :with => "tonno@gmail.com"
            fill_in "Password", :with => "canecane"
            fill_in "Confirmation", :with => "canecane"
            click_button "Create my account"

            visit "/logout"
            expect(current_path).to eq(login_path)
            
            visit "/login"
            fill_in "Email", :with => "tonno@gmail.com"
            fill_in "Password", :with => "canecane"
            click_button "Log in"
            
            assert is_logged_in?
        end
    
    end

end
