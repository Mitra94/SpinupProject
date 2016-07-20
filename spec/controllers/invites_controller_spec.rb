require 'rails_helper'

RSpec.describe InvitesController, type: :controller do 

	it "should create a new invite" do

		count = Invite.count
		Invite.create(:app => "prova", :sender => "1", :receiver => "2")
		assert Invite.count > count

	end

	it "should show an invite" do

		get :show, :id => 1
		assert_response :redirect

	end

	it "should get requests" do

		get :requests, :id => 1
		assert_response :redirect

	end

	it "should get pending invites" do

		get :pending_invites, :id => 1
		assert_response :redirect

	end

	it "should accept an invite (1)" do

		get :accept, :id => 1
		assert_response :redirect

	end


	it "should accept an invite (2)" do

		get :accept_invite, :id => 1
		assert_response :redirect

	end


	it "should refuse an invite (1)" do

		get :refuse, :id => 1
		assert_response :redirect

	end


	it "should refuse an invite (2)" do

		get :refuse_invite, :id => 1
		assert_response :redirect

	end

	it "should create an invite" do

		get :create_invite, :id => 1
		assert_response :redirect

	end



	end