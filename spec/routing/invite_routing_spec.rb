require 'rails_helper'

RSpec.describe "Invite routes", :type => :routing do


	it "should show an invite" do

		expect(:get => "invites/1").to route_to(
			:controller => "invites",
			:action => "show",
			:id => "1")


	end

	it "should create an invite" do

		expect(:get => "invites/new").to route_to(
			:controller => "invites",
			:action => "new")

	end

	it "should get requests" do

		expect(:get => "apps/1/requests").to route_to(
			:controller => "invites",
			:action => "requests",
			:id => "1")

	end

	it "should get pending_invites" do

		expect(:get => "developers/1/pending_invites").to route_to(
			:controller => "invites",
			:action => "pending_invites",
			:id => "1")

	end

	it "should get accept" do

		expect(:get => "apps/1/requests/accept").to route_to(
			:controller => "invites",
			:action => "accept",
			:id => "1")

	end

	it "should get accept_invite" do

		expect(:get => "developers/1/pending_invites/accept_invite").to route_to(
			:controller => "invites",
			:action => "accept_invite",
			:id => "1")

	end


	it "should get refuse" do

		expect(:get => "apps/1/requests/refuse").to route_to(
			:controller => "invites",
			:action => "refuse",
			:id => "1")

	end


	it "should get refuse_invite" do

		expect(:get => "developers/1/pending_invites/refuse_invite").to route_to(
			:controller => "invites",
			:action => "refuse_invite",
			:id => "1")

	end


	it "should get create_invite" do

		expect(:get => "apps/1/create_invite").to route_to(
			:controller => "invites",
			:action => "create_invite",
			:id => "1")

	end

end