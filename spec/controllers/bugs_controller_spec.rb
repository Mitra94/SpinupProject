require 'rails_helper'


RSpec.describe BugsController, type: :controller do 

	before :each do

		@app = FactoryGirl.create(:app)
		@developer = FactoryGirl.create(:developer)
		sign_in @developer

	end

	it "should show a bug" do

		bug = Bug.create(:app_id => @app.id, :founder => "tester", :description => "critical bug in db section")
		get :show, :id => bug.id
		assert_response :success
		expect(response).to render_template(:show)

	end


	it "should get app_bugs" do

		get :show_app_bugs, :id => @app.id
		assert_response :success
		expect(response).to render_template(:show_app_bugs)

	end

	it "should create a new bug" do

		expect{Bug.create(:app_id => @app.id, :founder => "tester", :description => "critical bug in db section")}.to change(Bug, :count)

	end


	it "should submit a bug" do

		get :submit_bug, :id => @app.id
		assert_response :success
		expect(response).to render_template(:submit_bug)

	end


	it "should get solved bug" do

		bug = Bug.create(:app_id => @app.id, :founder => "tester", :description => "critical bug in db section")
		get :solved_bug, :id => @app.id, :bug_id => bug.id 
		assert_response :redirect
		expect(response).to redirect_to(app_path(@app))

	end

	private

	def sign_in(developer)
		session[:developer_id] = developer.id
		current_developer = developer
		@current_developer = developer
	end

	def sign_out
		current_developer = nil
		@current_developer = nil
		cookies.delete(:remember_token)
	end

	def signed_in?
		return !@current_developer.nil?
	end

	
end