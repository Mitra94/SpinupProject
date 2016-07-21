require 'rails_helper'

RSpec.describe MicropostsController, type: :controller do

    before :each do
        @developer = FactoryGirl.create(:developer)
        sign_in @developer
        @app = FactoryGirl.create(:app)
    end
    
	describe 'POST #create' do
    
		context 'with valid attributes' do
			
            it 'add one micropost' do
                count = Micropost.count
                @micropost = FactoryGirl.create(:micropost)
                post :create, micropost: {developer: @micropost.developer, content: @micropost.content}, app_id: @app.id
                assert Micropost.count > count
            end 
            
			it "should create micropost" do
                @micropost = FactoryGirl.create(:micropost)
                post :create, micropost: {developer: @micropost.developer, content: @micropost.content}, app_id: @app.id
                assert_response :redirect
                expect(response).to redirect_to('/apps/1')
            end			
		end
		
		context "with invalid attributes" do
            it "does not save the micropost without content" do
                count = Micropost.count
                post :create, micropost: { developer_id: "1", content: nil}, app_id: @app.id
                expect(Micropost.count).to eq(count)
            end
            it "re-renders the new method" do
                post :create, micropost: { developer_id: "1", content: nil}, app_id: @app.id
                expect(response).to redirect_to('/apps/1')
            end
        end
	end
    
    describe 'PUT update' do
    
        before :each do
            @micropost = FactoryGirl.create(:micropost)
        end	
        
        context "valid attributes" do
        
            it "located the requested @micropost" do
                put :update, id: @micropost, micropost: { developer: @micropost.developer, content: @micropost.content }, app_id: @micropost.app
                expect(assigns(:micropost)).to eq(@micropost)
            end
            
            it "changes @micropost's attributes" do
                put :update, id: @micropost,
                micropost: { developer: @micropost.developer, content: "Modified" }, app_id: @micropost.app
                @micropost.reload
                expect(@micropost.content).to eq("Modified")
            end
            
            it "redirects to the updated micropost" do
                put :update, id: @micropost, micropost: { developer: @micropost.developer, content: "Modified" }, app_id: @micropost.app
                expect(response).to redirect_to ('/apps/2')
            end
            
        end
        context "invalid attributes" do
        
            it "locates the requested @micropost" do
                put :update, id: @micropost, micropost: { developer: @micropost.developer, content: nil }, app_id: @micropost.app
                expect(assigns(:micropost)).to eq(@micropost)
            end
            
            it "does not change @micropost's attributes" do
                put :update, id: @micropost,
                micropost: { developer: @micropost.developer, content: nil }, app_id: @micropost.app
                @micropost.reload
                expect(@micropost.content).not_to eq("Modified")
            end
        
        end
    end	
    
    describe 'DELETE destroy' do
    
        before :each do
            @micropost = FactoryGirl.create(:micropost)
        end	
        
        it "should delete micropost" do
            delete :destroy, :id => @micropost.id, micropost: { developer: @micropost.developer, content: nil }, app_id: @micropost.app
            assert_response :redirect
            expect(response).to redirect_to(root_path)
        end
        
    end
    
    private
    
    def sign_in(developer)
        session[:developer_id] = developer.id
        current_dev = developer
        @current_dev = developer
    end
    
    def sign_out
        current_dev = nil
        @current_dev = nil
        cookies.delete(:remember_token)
    end
    
    def signed_in?
        return !@current_dev.nil?
    end	
end
