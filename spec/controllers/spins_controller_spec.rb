require 'rails_helper'

RSpec.describe SpinsController, type: :controller do

	before :each do
		@user = FactoryGirl.create(:user)
		sign_in @user
		@opinion = FactoryGirl.create(:opinion)
		@app = FactoryGirl.create(:app)
	end
	
	describe 'POST #create' do
		context 'with valid attributes' do
			it 'creates the spin' do
				count = Spin.count
				@spin = FactoryGirl.create(:spin)
				post :create, spin: {spiner: @spin.spiner}, spined_id: @opinion.id
				assert Spin.count > count
			end 
		end
		
		context 'with invalid attributes' do
			it 're-renders the "new" view with invalid spiner' do
				post :create, spin: FactoryGirl.build(:spin, spiner: nil), spined_id: @opinion.id
				assert_response :redirect
				expect(response).to redirect_to('/apps/1')
			end	
			
			it 're-renders the "new" view with invalid spined' do
				post :create, spin: FactoryGirl.build(:spin, spined: nil), spined_id: @opinion.id
				assert_response :redirect
				expect(response).to redirect_to('/apps/1')
			end											
		end
	end
	
	it 'destroy spin' do
        post :create, spin: {}, spiner_id: @user, spined_id: @opinion
        post :destroy, :id => @opinion.id, spin: {}, spiner_id: @user, spined_id: @opinion
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
