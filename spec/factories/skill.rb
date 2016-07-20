require 'faker'

FactoryGirl.define do
	
	factory :skill do |s|

		s.html_css { Faker::Number.between(0, 10) }
		s.java { Faker::Number.between(0, 10) }
		s.javascript { Faker::Number.between(0, 10) }
		s.c { Faker::Number.between(0, 10) }
		s.c_plus_plus { Faker::Number.between(0, 10) }
		s.nodejs { Faker::Number.between(0, 10) }
		s.database { Faker::Number.between(0, 10) }
		s.algorithms { Faker::Number.between(0, 10) }
		s.android { Faker::Number.between(0, 10) }
		s.ios { Faker::Number.between(0, 10) }
	end

end