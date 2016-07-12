require 'faker'

FactoryGirl.define do
  factory :like do |l|
    l.liker { FactoryGirl.create(:user)  }
    l.liked { FactoryGirl.create(:micropost)  }
  end
end
