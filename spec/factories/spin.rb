require 'faker'

FactoryGirl.define do
  factory :spin do |s|
    s.spiner { FactoryGirl.create(:user)  }
    s.spined { FactoryGirl.create(:opinion)  }
  end
end
