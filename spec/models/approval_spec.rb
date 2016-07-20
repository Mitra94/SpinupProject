require 'rails_helper'


RSpec.describe Approval, type: :model do 
	

	it "is valid" do

		assert FactoryGirl.create(:approval).valid?

	end

	it "is valid with nil field on skill" do

		approve = FactoryGirl.create(:approval)
		approve.update_attributes(:skill => nil)
		assert !approve.valid?

	end


	it "is valid with a nil field on voted" do

		approve = FactoryGirl.create(:approval)
		approve.update_attributes(:voted => nil)
		assert !approve.valid?


	end


	it "is valid with a nil field on voter" do

		approve = FactoryGirl.create(:approval)
		approve.update_attributes(:voter => nil)
		assert !approve.valid?


	end

	it "is valid with different value of skill" do

		approve = FactoryGirl.create(:approval)
		approve.update_attributes(:skill => "ruby on rails")
		assert !approve.valid?


	end


	
end