require 'rails_helper'


RSpec.describe BugsController, type: :controller do 

	before :each do

		@developer = FactoryGirl.create(:developer)
		sign_in @developer

	end

	it "should show a bug" do

		bug = Bug.create(:app_id => 1, :founder => "tester", :description => "critical bug in db section")
		get :show, :id => bug.id
		assert_response :success

	end


	it "should get app_bugs" do

		get :show_app_bugs, :id => 1
		assert_response :success

	end

	it "should create a new bug" do

		count = Bug.count
		Bug.create(:app_id => 1, :founder => "tester", :description => "critical bug in db section")
		assert Bug.count > count

	end


	it "should submit a bug" do

		get :submit_bug, :id => 1
		assert_response :success

	end


	it "should get solved bug" do

		bug = Bug.create(:app_id => 1, :founder => "tester", :description => "critical bug in db section")
		get :solved_bug, :id => 1, :bug_id => bug.id 
		assert_response :redirect

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