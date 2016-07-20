require 'rails_helper'


RSpec.describe Report, type: :model do 

	it "is valid" do

		assert FactoryGirl.create(:report).valid?


	end

	it "adds a report to db" do

		count = Report.count
		FactoryGirl.create(:report)
		assert Report.count > count

	end


	it "is valid with a nil argument(1)" do

		report = FactoryGirl.create(:report)
		report.update_attributes(:user_id => nil)
		assert !report.valid?


	end


	it "is valid with a nil argument(2)" do

		report = FactoryGirl.create(:report)
		report.update_attributes(:comment => nil)
		assert !report.valid?


	end


	it "is valid with a nil argument(3)" do

		report = FactoryGirl.create(:report)
		report.update_attributes(:post_id => nil)
		assert !report.valid?


	end


	it "is valid with a nil argument(3)" do

		report = FactoryGirl.create(:report)
		report.update_attributes(:app_id => nil)
		assert !report.valid?


	end


	it "is valid with wrong argument(1)" do


		report = FactoryGirl.create(:report)
		report.update_attributes(:user_id => 0)
		assert !report.valid?

	end


	it "is valid with wrong argument(2)" do


		report = FactoryGirl.create(:report)
		report.update_attributes(:post_id => 0)
		assert !report.valid?

	end


	it "is valid with wrong argument(3)" do


		report = FactoryGirl.create(:report)
		report.update_attributes(:app_id => 0)
		assert !report.valid?


	end
	
end