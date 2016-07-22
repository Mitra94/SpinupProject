require 'rails_helper'

RSpec.describe DevelopersController, type: :controller do
    
    before :each do
        @dev = FactoryGirl.create(:developer)
        sign_in @dev
    end
    
    it "should show user" do
        @skill = FactoryGirl.create(:skill)
        get :show, :id => @dev
        expect(response).to render_template(:show)
    end
    
    describe 'PUT update' do
      
      context "valid attributes" do
        it "located the requested @user" do
          put :update, id: @dev, developer: { name: @dev.name }
          expect(assigns(:developer)).to eq(@dev)      
        end
      
        it "changes @user's attributes" do
          put :update, id: @dev, developer: { name: "Larry" }
          @dev.save!
          assert_response :success
        end

      end
      
      context "invalid attributes" do
        it "locates the requested @user" do
          put :update, id: @dev, developer: { name: "e"}
          expect(assigns(:developer)).to eq(@dev)      
        end
        
        it "does not change @user's attributes" do
          @email = @dev.email
          put :update, id: @dev, 
            developer: { firstname: "Larry", email: nil}
          @dev.reload
          expect(@dev.name).not_to eq("larry")
          expect(@dev.email).to eq(@email)
        end
        
        it "re-renders the edit method" do
          put :update, id: @dev, developer: {email: nil}
          expect(response).to render_template(:edit) 
        end
      end
    end
    
    private
    
    def sign_in(dev)
     #cookies.permanent.signed[:remember_token] = [user.id]
     session[:developer_id] = dev.id
     current_dev = dev
     @current_dev = dev
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
