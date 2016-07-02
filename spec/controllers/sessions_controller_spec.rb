require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

    describe "login" do
        
        it "should be logged in" do
            get login_path
            post login_path, session: { email: 'example@example.org', password: 'foobarbar' }
            assert is_logged_in?
        end
    
    end

end
