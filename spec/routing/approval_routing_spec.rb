require 'rails_helper'

RSpec.describe "Approval routes", :type => :routing do

	it "should create a new approval" do

		expect(:get => "approvals/new").to route_to(
			:controller => "approvals",
			:action => "new")

	end


	
end