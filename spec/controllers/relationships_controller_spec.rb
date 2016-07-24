require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
    
    before :each do
        @user = FactoryGirl.create(:user)
        sign_in @user
        @app = FactoryGirl.create(:app)
    end
    
    it "should create relationship" do
          post :create, relationship: {}, follower_id: @user, followed_id: @app
          expect(response).to redirect_to(@app)
    end
    
    it "should destroy relationship" do
          post :create, relationship: {}, follower_id: @user, followed_id: @app
          post :destroy, :id => @app.id, relationship: {}, follower_id: @user, followed_id: @app
          expect(response).to redirect_to(@app)
    end
    
    private
    
    def sign_in(user)
     session[:user_id] = user.id
     current_user = user
     @current_user = user
    end

    def sign_out
     current_user = nil
     @current_user = nil
     cookies.delete(:remember_token)
    end

    def signed_in?
     return !@current_user.nil?
    end
end
