require 'rails_helper'

RSpec.describe MicropostsController, type: :controller do

	#describe 'POST #create' do
		#context 'with valid attributes' do
			#it 'creates the micropost' do
				#app = FactoryGirl.create(:app)
				#post :'apps/:id/create', micropost: FactoryGirl.create(:micropost)
				#expect(Micropost.count).to eq(1)
			#end 
			
			#it 'redirects to the "show" action for the new micropost' do
			#	post :create, micropost: FactoryGirl.create(:micropost)
			#	expect(response).to redirect_to micropost
			#end			
		#end
		
		#context 'with invalid attributes' do
			#it 'does not create the micropost without content' do
				#post :create, micropost: FactoryGirl.build(:micropost, content: nil)
				#expect(micropost.count).to eq(0)
			#end
			
			#it 'does not create the micropost without app' do
				#post :create, micropost: FactoryGirl.build(:micropost, app: nil)
				#expect(micropost.count).to eq(0)
			#end
			
			#it 'does not create the micropost without developer' do
				#post :create, micropost: FactoryGirl.build(:micropost, developer: nil)
				#expect(micropost.count).to eq(0)
			#end
			
			#it 'does not create the micropost without app version' do
				#post :create, micropost: FactoryGirl.build(:micropost, app_version: nil)
				#expect(micropost.count).to eq(0)
			#end
			
			#it 're-renders the "new" view' do
			#	post :create, app: FactoryGirl.build(:app, name: nil)
			#	expect(response).to redirect_to new_app_path
			#end						
		#end
end
