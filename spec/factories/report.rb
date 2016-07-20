require 'faker'

FactoryGirl.define do 

	factory :report do |r|

		r.user_id 1
		r.comment {FactoryGirl.create(:opinion).content}
		r.post_id 3
		r.app_id 2

	end
	
end