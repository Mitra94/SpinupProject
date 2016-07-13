require 'faker'

FactoryGirl.define do
  factory :notification do |n|
    n.notifier { FactoryGirl.create(:user)  }
    n.notified { FactoryGirl.create(:user)  }
    n.opinion { FactoryGirl.create(:opinion)  }
    n.kind "something"
  end
end
