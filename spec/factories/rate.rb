require 'faker'

FactoryGirl.define do
  factory :rate do |f|
    f.rater_id { FactoryGirl.create(:user).id  }
    f.rateable_id { FactoryGirl.create(:app).id  }
    f.rateable_type "App"
  end
end
