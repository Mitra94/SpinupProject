require 'faker'

FactoryGirl.define do
  factory :comment do |c|
    c.developer { FactoryGirl.create(:developer)  }
    c.micropost { FactoryGirl.create(:micropost)  }
    c.content "test"
  end
end
