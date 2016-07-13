require 'rails_helper'

RSpec.describe AppsController, type: :controller do
  
	describe 'POST #create' do
		context 'with valid attributes' do
			it 'creates the app' do
				post :create, app: FactoryGirl.create(:app)
				expect(App.count).to eq(1)
			end 
			
			#it 'redirects to the "show" action for the new app' do
			#	post :create, app: FactoryGirl.create(:app)
			#	expect(response).to redirect_to app
			#end			
		end
		
		context 'with invalid attributes' do
			it 'does not create the app without name' do
				post :create, app: FactoryGirl.build(:app, name: nil)
				expect(App.count).to eq(0)
			end
			
			it 'does not create the app without platform' do
				post :create, app: FactoryGirl.build(:app, platform: nil)
				expect(App.count).to eq(0)
			end
			
			it 'does not create the app without category' do
				post :create, app: FactoryGirl.build(:app, category: nil)
				expect(App.count).to eq(0)
			end
			
			it 'does not create the app without version' do
				post :create, app: FactoryGirl.build(:app, version: nil)
				expect(App.count).to eq(0)
			end
			
			#it 're-renders the "new" view' do
			#	post :create, app: FactoryGirl.build(:app, name: nil)
			#	expect(response).to redirect_to new_app_path
			#end						
		end
	end
end
