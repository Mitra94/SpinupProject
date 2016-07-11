FactoryGirl.define do
  factory :notification do
    notifier nil
    notified nil
    opinion nil
    kind "MyString"
    read false
  end
end
