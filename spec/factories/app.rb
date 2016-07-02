require 'faker'

FactoryGirl.define do
  factory :app do |f|
    f.name { Faker::Name.name   }
    f.platform "ios"
    f.category "Game"
  end
end
