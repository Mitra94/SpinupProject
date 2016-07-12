require 'faker'

FactoryGirl.define do
  factory :love do |l|
    l.lover { FactoryGirl.create(:user)  }
    l.loved { FactoryGirl.create(:comment)  }
  end
end
