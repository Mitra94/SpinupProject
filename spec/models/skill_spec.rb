require 'rails_helper'


RSpec.describe Skill, type: :model do 

	it "is valid" do

		assert FactoryGirl.create(:skill).valid?

	end

	it "adds a skill to db" do

		count = Skill.count
		FactoryGirl.create(:skill)
		assert Skill.count > count

	end

	it "html+css greater or equal to 0 and less or equal 50" do

			skill = FactoryGirl.create(:skill)
			assert skill.html_css >= 0 or skill.html_css <= 50

	end

	it "java greater or equal to 0 and less or equal 50" do

			skill = FactoryGirl.create(:skill)
			assert skill.java >= 0 or skill.java <= 50

	end

	it "javascript greater or equal to 0 and less or equal 50" do

			skill = FactoryGirl.create(:skill)
			assert skill.javascript >= 0 or skill.javascript <= 50

	end
	
	it "c greater or equal to 0 and less or equal 50" do

			skill = FactoryGirl.create(:skill)
			assert skill.c >= 0 or skill.c <= 50

	end

	it "c++ greater or equal to 0 and less or equal 50" do

			skill = FactoryGirl.create(:skill)
			assert skill.c_plus_plus >= 0 or skill.c_plus_plus <= 50

	end

	it "nodejs greater or equal to 0 and less or equal 50" do

			skill = FactoryGirl.create(:skill)
			assert skill.nodejs >= 0 or skill.nodejs <= 50

	end

	it "database greater or equal to 0 and less or equal 50" do

			skill = FactoryGirl.create(:skill)
			assert skill.database >= 0 or skill.database <= 50

	end

	it "algorithms greater or equal to 0 and less or equal 50" do

			skill = FactoryGirl.create(:skill)
			assert skill.algorithms >= 0 or skill.algorithms <= 50

	end

	it "android greater or equal to 0 and less or equal 50" do

			skill = FactoryGirl.create(:skill)
			assert skill.android >= 0 or skill.android <= 50

	end

	it "ios greater or equal to 0 and less or equal 50" do

			skill = FactoryGirl.create(:skill)
			assert skill.ios >= 0 or skill.ios <= 50

	end


	it "html+css valid with negative number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:html_css => -1)
			assert !skill.valid?

	end

	it "java valid with negative number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:java => -1)
			assert !skill.valid?

	end

	it "javascript valid with negative number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:javascript => -1)
			assert !skill.valid?

	end

	it "c valid with a negative number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:c => -1)
			assert !skill.valid?

	end

	it "c++ valid with a negative number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:c_plus_plus => -1)
			assert !skill.valid?

	end

	it "nodejs valid with a negative number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:nodejs => -1)
			assert !skill.valid?

	end

	it "database valid with a negative number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:database => -1)
			assert !skill.valid?

	end

	it "algorithms valid with a negative number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:algorithms => -1)
			assert !skill.valid?
	end

	it "android valid with a negative number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:android => -1)
			assert !skill.valid?

	end

	it "ios valid with a negative number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:ios => -1)
			assert !skill.valid?

	end

	it "html+css valid with huge number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:html_css => 5000)
			assert !skill.valid?

	end

	it "java valid with huge number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:java => 5000)
			assert !skill.valid?

	end

	it "javascript valid with huge number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:javascript => 5000)
			assert !skill.valid?

	end

	it "c valid with huge number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:c => 5000)
			assert !skill.valid?

	end

	it "c++ valid with huge number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:c_plus_plus => 5000)
			assert !skill.valid?

	end

	it "nodejs valid with huge number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:nodejs => 5000)
			assert !skill.valid?

	end

	it "database valid with huge number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:database => 5000)
			assert !skill.valid?

	end

	it "algorithms valid with huge number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:algorithms => 5000)
			assert !skill.valid?

	end

	it "android valid with huge number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:android => 5000)
			assert !skill.valid?

	end

	it "ios valid with huge number" do

			skill = FactoryGirl.create(:skill)
			skill.update_attributes(:ios => 5000)
			assert !skill.valid?

	end



end