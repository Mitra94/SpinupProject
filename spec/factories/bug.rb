require 'faker'


FactoryGirl.define do
	
	factory :bug do |b|

		b.app_id 1
		b.founder "developer"
		b.description "critical bug in db section"


	end


end