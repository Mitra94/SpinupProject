require 'rails_helper'


RSpec.describe Bug, type: :model do


	it "is valid" do

		assert FactoryGirl.create(:bug).valid?

	end

	it "is adds a bug to db" do

		count = Bug.count
		FactoryGirl.create(:bug)
		assert Bug.count > count

	end


	it "is valid with a nil field(1)" do

		bug = FactoryGirl.create(:bug)
		bug.update_attributes(:app_id => nil)
		assert !bug.valid?

	end


	it "is valid with a nil field(2)" do

		bug = FactoryGirl.create(:bug)
		bug.update_attributes(:founder => nil)
		assert !bug.valid?

	end

	it "is valid with a nil field(3)" do

		bug = FactoryGirl.create(:bug)
		bug.update_attributes(:description => nil)
		assert !bug.valid?

	end

	it "is valid with wrong app_id field" do

		bug = FactoryGirl.create(:bug)
		bug.update_attributes(:app_id => -1)
		assert !bug.valid?

	end

	it "is valid with wrong description field" do

		bug = FactoryGirl.create(:bug)
		bug.update_attributes(:description => "a" * 257)
		assert !bug.valid?

	end

	it "is valid with wrong app_id" do

		bug = FactoryGirl.create(:bug)
		bug.update_attributes(:app_id => 0)
		assert !bug.valid?

	end
	
end