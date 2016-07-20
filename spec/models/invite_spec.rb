require 'rails_helper'


RSpec.describe Invite, type: :model do 

	it "is valid" do

		assert FactoryGirl.create(:invite).valid?

	end

	it "add an invite to db" do

		count = Invite.count
		FactoryGirl.create(:invite)
		assert Invite.count > count

	end

	it "is valid with nil arguments(1)" do

		invite = FactoryGirl.create(:invite)
		invite.update_attributes(:app => nil)
		assert !invite.valid?

	end

	it "is valid with nil arguments(2)" do

		invite = FactoryGirl.create(:invite)
		invite.update_attributes(:sender => nil)
		assert !invite.valid?

	end

	it "is valid with nil arguments(3)" do

		invite = FactoryGirl.create(:invite)
		invite.update_attributes(:receiver => nil)
		assert !invite.valid?

	end
	
end