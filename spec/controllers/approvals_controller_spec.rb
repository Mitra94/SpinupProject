require 'rails_helper'

RSpec.describe ApprovalsController, type: :controller do

	it "should create a new approval" do

		count = Approval.count
		approval = Approval.create(:skill => 'htmlcss', :voted => 1, :voter => "voter")
		assert Approval.count > count

	end
end