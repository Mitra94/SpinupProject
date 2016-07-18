require 'faker'

FactoryGirl.define do
  factory :rate do |f|
    f.rater_id "1"
    f.rateable_id "1"
    f.stars "4"
  end
end
