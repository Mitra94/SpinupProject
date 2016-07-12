require 'faker'

FactoryGirl.define do
  factory :micropost do |m|
    m.developer { FactoryGirl.create(:developer)  }
    m.app { FactoryGirl.create(:app)  }
    m.content "test"
    m.app_version { Faker::Number.between(1, 10) }
  end
end
