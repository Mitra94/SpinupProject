require 'rails_helper'

RSpec.describe LikesController, type: :controller do

	before :each do
		@user = FactoryGirl.create(:user)
		sign_in @user
		@micropost = FactoryGirl.create(:micropost)
		@app = FactoryGirl.create(:app)
	end
	
	describe 'POST #create' do
		context 'with valid attributes' do
			it 'creates the like' do
				count = Like.count
				@like = FactoryGirl.create(:like)
				post :create, like: {liker: @like.liker}, liked_id: @micropost.id
				assert Like.count > count
			end 
		end
		
		context 'with invalid attributes' do
			it 're-renders the "new" view with invalid liker' do
				post :create, like: FactoryGirl.build(:like, liker: nil), liked_id: @micropost.id
				assert_response :redirect
				expect(response).to redirect_to('/apps/1')
			end	
			
			it 're-renders the "new" view with invalid liked' do
				post :create, like: FactoryGirl.build(:like, liked: nil), liked_id: @micropost.id
				assert_response :redirect
				expect(response).to redirect_to('/apps/1')
			end											
		end
	end
	
	it 'destroy like' do
        post :create, like: {}, liker_id: @user, liked_id: @micropost
        post :destroy, :id => @micropost.id, like: {}, liker_id: @user, liked_id: @micropost
        expect(response).to redirect_to('/apps/1')
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
