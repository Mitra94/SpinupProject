require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.username { Faker::Name.name }
    f.email { Faker::Internet.email }
    f.password "lezzolezzo"
    f.password_confirmation "lezzolezzo"
  end
end
