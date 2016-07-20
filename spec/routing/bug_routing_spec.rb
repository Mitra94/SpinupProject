require 'rails_helper'


RSpec.describe "Bug routes", :type => :routing do 

	it "should create a bug" do

		expect(:get => "bugs/new").to route_to(
			:controller => "bugs",
			:action => "new")

	end

	it "should get show" do

		expect(:get => "bugs/1").to route_to(
			:controller => "bugs",
			:action => "show",
			:id => "1")

	end

	it "should get show_app_bugs" do

		expect(:get => "apps/1/show_app_bugs").to route_to(
			:controller => "bugs",
			:action => "show_app_bugs",
			:id => "1")

	end


	it "should get submit_bug" do

		expect(:get => "apps/1/submit_bug").to route_to(
			:controller => "bugs",
			:action => "submit_bug",
			:id => "1")

	end

	it "should get solved_bug" do

		expect(:get => "apps/1/show_app_bugs/solved_bug").to route_to(
			:controller => "bugs",
			:action => "solved_bug",
			:id => "1")

	end



end