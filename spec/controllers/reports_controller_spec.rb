require 'rails_helper'


RSpec.describe ReportsController, type: :controller do 

	before :each do

		@developer = FactoryGirl.create(:developer)
		sign_in @developer

	end


	it "should list_reports" do

		get :list_reports
		assert_response :success

	end


	it "should create a report" do

		get :new
		assert_response :success

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