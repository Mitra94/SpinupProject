require 'faker'

FactoryGirl.define do
  factory :opinion do |o|
    o.user { FactoryGirl.create(:user)  }
    o.micropost { FactoryGirl.create(:micropost)  }
    o.content "test"
  end
end
