require 'rails_helper'

RSpec.describe LovesController, type: :controller do

	before :each do
		@user = FactoryGirl.create(:user)
		sign_in @user
		@comment = FactoryGirl.create(:comment)
		@app = FactoryGirl.create(:app)
	end
	
	describe 'POST #create' do
		context 'with valid attributes' do
			it 'creates the love' do
				count = Love.count
				@love = FactoryGirl.create(:love)
				post :create, love: {lover: @love.lover}, loved_id: @comment.id
				assert Love.count > count
			end 
		end
		
		context 'with invalid attributes' do
			it 're-renders the "new" view with invalid lover' do
				post :create, love: FactoryGirl.build(:love, lover: nil), loved_id: @comment.id
				assert_response :redirect
				expect(response).to redirect_to('/apps/1')
			end	
			
			it 're-renders the "new" view with invalid loved' do
				post :create, love: FactoryGirl.build(:love, loved: nil), loved_id: @comment.id
				assert_response :redirect
				expect(response).to redirect_to('/apps/1')
			end											
		end
	end
	
	it 'destroy like' do
        post :create, love: {}, lover_id: @user, loved_id: @comment
        post :destroy, :id => @comment.id, love: {}, lover_id: @user, loved_id: @comment
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
