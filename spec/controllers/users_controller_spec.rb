require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    
    before :each do
        @user = FactoryGirl.create(:user)
        sign_in @user
    end
    
    it "should show user" do
        get :show, :id => @user
        expect(response).to render_template(:show)
    end
    
    #credo che bisogna farlo funzionare solo per l' admin, così non va
    #describe "GET index" do

        #it "renders the index template" do
          #get :index
          #expect(response).to render_template("index")
        #end
    #end
    
    describe 'PUT update' do
      
      context "valid attributes" do
        it "located the requested @user" do
          put :update, id: @user, user: { username: @user.username }
          expect(assigns(:user)).to eq(@user)      
        end
      
        it "changes @user's attributes" do
          put :update, id: @user, user: { username: "Larry" }
          @user.save!
          assert_response :success
        end

      end
      
      context "invalid attributes" do
        it "locates the requested @user" do
          put :update, id: @user, user: { username: "e"}
          expect(assigns(:user)).to eq(@user)      
        end
        
        it "does not change @user's attributes" do
          @email = @user.email
          put :update, id: @user, 
            user: { username: "Larry", email: nil}
          @user.reload
          expect(@user.username).not_to eq("larry")
          expect(@user.email).to eq(@email)
        end
        
        it "re-renders the edit method" do
          put :update, id: @user, user: {email: nil}
          expect(response).to render_template(:edit) 
        end
      end
    end
    
    private
    
    def sign_in(user)
     #cookies.permanent.signed[:remember_token] = [user.id]
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
