require 'faker'

FactoryGirl.define do
  factory :app do |f|
    f.name { Faker::Name.name   }
    f.platform "ios"
    f.category "Game"
    f.version "1.0"
  end
end
