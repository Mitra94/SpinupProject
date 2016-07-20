require 'rails_helper'


RSpec.describe "Report routes", :type => :routing do 

	it "should show a report" do

		expect(:get => "reports/1").to route_to(
			:controller => "reports",
			:action => "show",
			:id => "1")

	end

	it "should get list_reports" do

		expect(:get => "list_reports").to route_to(
			:controller => "reports",
			:action => "list_reports")

	end

	it "should create a report" do

		expect(:get => "reports/new").to route_to(
			:controller => "reports",
			:action => "new")

	end
	
end