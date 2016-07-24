require 'rails_helper'

RSpec.describe AppsController, type: :controller do
    
    before :each do
        @user = FactoryGirl.create(:user)
        sign_in @user
    end

    it "should show app" do
          @app = FactoryGirl.create(:app)
          get :show, :id => @app
          assert_response :success
    end
    
    it "should create app" do
          @app = FactoryGirl.create(:app)
          post :create, app: { category: @app.category, name: @app.name, platform: @app.platform }
          assert_response :success
    end
    
    it "should must have app" do
          @app = FactoryGirl.create(:app)
          post :create, app: { category: @app.category, name: @app.name, platform: @app.platform }
          get :musthave
          assert_response :success
    end
    
    it "should show fresh apps" do
          @app = FactoryGirl.create(:app)
          get :fresh
          assert_response :success
    end 

    it "should delete an app" do
    	@app = FactoryGirl.create(:app)
    	@dev = FactoryGirl.create(:developer)
    	@app.developers << @dev
    	delete :destroy, :id => @app.id
    	assert_response :redirect
    	expect(response).to redirect_to(developer_path(@dev))
    end
    
    it "should show chosen for you apps" do
          @app = FactoryGirl.create(:app)
          get :chosenforyou
          assert_response :success
    end
    
    it "should show app of the day" do
          @app = FactoryGirl.create(:app)
          post :create, app: { category: @app.category, name: @app.name, platform: @app.platform }
          get :appoftheday
          expect(response.status).to eq(302)
          expect(response).to redirect_to('/apps/1') 
    end
    
    it "should show random app" do
          @app = FactoryGirl.create(:app)
          post :create, app: { category: @app.category, name: @app.name, platform: @app.platform }
          get :random
          expect(response.status).to eq(302)
          expect(response).to redirect_to('/apps/1') 
    end
    
    it "should show random app" do
          @app = FactoryGirl.create(:app)
          post :create, app: { category: @app.category, name: @app.name, platform: @app.platform }
          get :index
          #assert_response :success
          expect(response).to render_template(:index) 
    end
    
    describe "GET #index" do
      it "populates an array of apps" do
        app = FactoryGirl.create(:app)
        get :index
        expect(assigns(:apps)).to eq([app])
      end
      
      it "renders the :index view" do
        get :index
        expect(response).to render_template :index
      end
    end
    
    describe "POST create" do
      context "with valid attributes" do
        
        it "redirects to the new contact" do
          post :create, app: { category: "Game", name: "Simone", platform: "ios" }
          expect(response.status).to eq(200)
        end
      end
      
      context "with invalid attributes" do
        it "does not save the new contact" do
          expect{
            post :create, app: { category: "Game", name: "Simone", platform: nil }
          }.to_not change(App,:count)
        end
        
        it "re-renders the new method" do
          post :create, app: { category: "Game", name: "Simone", platform: nil }
          expect(response).to render_template :new
        end
      end 
    end
    
    describe 'PUT update' do
      before :each do
        @app = FactoryGirl.create(:app)
      end
      
      context "valid attributes" do
        it "located the requested @app" do
          put :update, id: @app, app: { category: @app.category, name: @app.name, platform: @app.platform }
          expect(assigns(:app)).to eq(@app)      
        end
      
        it "changes @app's attributes" do
          put :update, id: @app, 
            app: { category: @app.category, name: "Simoncino", platform: @app.platform }
          @app.reload
          expect(@app.name).to eq("Simoncino")
        end
      
        it "redirects to the updated app" do
          put :update, id: @app, app: { category: @app.category, name: "Simoncino", platform: @app.platform }
          expect(response).to redirect_to @app
        end
      end
      
      context "invalid attributes" do
        it "locates the requested @app" do
          put :update, id: @app, app: { category: @app.category, name: "Simoncino", platform: nil }
          expect(assigns(:app)).to eq(@app)      
        end
        
        it "does not change @app's attributes" do
          put :update, id: @app, 
            app: { category: @app.category, name: "Simon", platform: nil }
          @app.reload
          expect(@app.name).not_to eq("Simon")
        end
        
        it "re-renders the edit method" do
          put :update, id: @app, app: { category: @app.category, name: "Simon", platform: nil }
          expect(response).to render_template :edit
        end
      end
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
