require 'faker'

FactoryGirl.define do
	
	factory :invite do |i|

		i.app  "prova"
		i.receiver  "2"
		i.sender  "1"

	end


end