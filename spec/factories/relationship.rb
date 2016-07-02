require 'faker'

FactoryGirl.define do
  factory :relationship do |f|
    f.follower { FactoryGirl.create(:user)  }
    f.followed { FactoryGirl.create(:app)  }
  end
end
