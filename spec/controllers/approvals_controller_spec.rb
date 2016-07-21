require 'rails_helper'

RSpec.describe ApprovalsController, type: :controller do

	it "should create a new approval" do

		expect{(Approval.create(:skill => "htmlcss", :voted => 1, :voter => "voter"))}.to change(Approval, :count)

	end

	it "should fail creation" do

		expect{(Approval.create(:skill => "ruby on rails", :voted => 1, :voter => "voter"))}.to_not change(Approval, :count)

	end

end