require 'rails_helper'

RSpec.describe InvitesController, type: :controller do 

	before :each do
		@developer = FactoryGirl.create(:developer)
		sign_in @developer
		@app = FactoryGirl.create(:app)
		@app.update_attributes(:name => "test")

	end

	it "should create a new invite" do

		count = Invite.count
		Invite.create(:app => "prova", :sender => "1", :receiver => "2")
		assert Invite.count > count

	end

	it "should show an invite" do

		invite = Invite.create(:app => "prova", :sender => "1", :receiver => "2")
		get :show, :id => invite.id
		assert_response :success

	end

	it "should get requests" do

		get :requests, :id => 1
		assert_response :success

	end

	it "should get pending invites" do

		get :pending_invites, :id => 1
		assert_response :success

	end

	it "should accept an invite (1)" do

		invite = Invite.create(:app => @app.name, :sender => "2", :receiver => @developer.id)
		get :accept, :id => @app.id
		assert_response :redirect

	end


	it "should accept an invite (2)" do

		invite = Invite.create(:app => @app.name, :sender => "2", :receiver => @developer.id)
		get :accept_invite, :id => @app.id
		assert_response :redirect

	end


	it "should refuse an invite (1)" do

		invite = Invite.create(:app => @app.name, :sender => "2", :receiver => @developer.id)
		get :refuse, :id => @app.id
		assert_response :redirect

	end


	it "should refuse an invite (2)" do

		invite = Invite.create(:app => @app.name, :sender => "2", :receiver => @developer.id)
		get :refuse_invite, :id => @app.id
		assert_response :redirect

	end

	it "should create an invite" do

		@app.developers << @developer
		invite = Invite.create(:app => @app.name, :sender => @developer.id, :receiver => @developer.id)
		get :create_invite, :id => @app.id
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