require 'rails_helper'

RSpec.describe OpinionsController, type: :controller do

	before :each do
		@user = FactoryGirl.create(:user)
		sign_in @user
		@micropost = FactoryGirl.create(:micropost)
		@app = FactoryGirl.create(:app)
	end
	
	describe "POST create" do
		context "with valid attributes" do
			it 'add one opinion' do
				count = Opinion.count
				@opinion = FactoryGirl.create(:opinion)
				post :create, opinion: {user: @opinion.user, content: @opinion.content}, micropost_id: @micropost.id
				assert Opinion.count > count
			end 	
			
			it "should create opinion" do
				@opinion = FactoryGirl.create(:opinion)
				post :create, opinion: {user: @opinion.user, content: @opinion.content}, micropost_id: @micropost.id
				assert_response :redirect
				expect(response).to redirect_to('/apps/1')
			end			
		end
		
		context "with invalid attributes" do
			it "does not save the opinion without content" do
				count = Opinion.count
				post :create, opinion: { user_id: "1", content: nil}, micropost_id: @micropost.id
				expect(Opinion.count).to eq(count)
			end
			
			it "re-renders the new method" do
				post :create, opinion: { user_id: "1", content: nil}, micropost_id: @micropost.id
				expect(response).to redirect_to('/apps/1')
			end
		end
	end
	
	describe 'PUT update' do
		before :each do
			@opinion = FactoryGirl.create(:opinion)
		end		
		
		context "valid attributes" do
			it "located the requested @opinion" do
				put :update, id: @opinion, opinion: { user: @opinion.user, micropost: @opinion.micropost, content: @opinion.content }
				expect(assigns(:opinion)).to eq(@opinion)
			end

			it "changes @opinion's attributes" do
				put :update, id: @opinion,
				opinion: { user: @opinion.user, micropost: @opinion.micropost, content: "Modified" }
				@opinion.reload
				expect(@opinion.content).to eq("Modified")
			end

			it "redirects to the updated opinion" do
				put :update, id: @opinion, opinion: { user: @opinion.user, micropost: @opinion.micropost, content: "Modified" }
				expect(response).to redirect_to ('/apps/3')
			end
		end
		
		context "invalid attributes" do
			it "locates the requested @opinion" do
				put :update, id: @opinion, opinion: { user: @opinion.user, micropost: @opinion.micropost, content: nil }
				expect(assigns(:opinion)).to eq(@opinion)
			end
			
			it "does not change @opinion's attributes" do
				put :update, id: @opinion,
				opinion: { user: @opinion.user, micropost: @opinion.micropost, content: nil }
				@opinion.reload
				expect(@opinion.content).not_to eq("Modified")
			end
		end
	end	
	
	describe 'DELETE destroy' do
		before :each do
			@opinion = FactoryGirl.create(:opinion)
		end	
		
		it "should delete opinion" do
			delete :destroy, :id => @opinion.id
			assert_response :redirect
			expect(response).to redirect_to(root_path)
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
