require 'faker'

FactoryGirl.define do
  factory :developer do |f|
    f.name { Faker::Name.first_name }
    f.surname { Faker::Name.last_name }
    f.email { Faker::Internet.email }
    f.city { Faker::Address.city }
    f.age { Faker::Number.between(1, 100) }
    f.password "lezzolezzo"
    f.password_confirmation "lezzolezzo"
  end
end
