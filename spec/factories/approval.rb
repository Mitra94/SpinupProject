require 'faker'


FactoryGirl.define  do
	
	factory :approval do |a|

		a.skill  "htmlcss"
		a.voted  1
		a.voter  "voter"


	end


end