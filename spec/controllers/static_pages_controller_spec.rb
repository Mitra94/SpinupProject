require 'rails_helper'

RSpec.describe StatisPagesController, type: :controller do

    describe "signup" do
        
        it "invalid signup information" do
            get signup_path
            assert_no_difference 'User.count' do
              post users_path, params: { user: { name:  "",
                                                 email: "user@invalid",
                                                 password:              "foo",
                                                 password_confirmation: "bar" } }
            end
            assert_template 'users/new'
        end
    
    end

end