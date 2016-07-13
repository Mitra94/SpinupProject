require 'rails_helper'

RSpec.describe Notification, type: :model do

  it "has a valid factory" do
    assert FactoryGirl.create(:notification).valid?
  end

  it "has none to begin with" do
    expect(Notification.count).to eq 0
  end

  it "has one after adding one" do
    notification = FactoryGirl.create(:notification)
    expect(notification.save!).to eq true
  end
  
  it "is invalid without a notifier" do
    assert !FactoryGirl.build(:notification, notifier: nil).valid?
  end
  
  it "is invalid without a notified" do
    assert !FactoryGirl.build(:notification, notified: nil).valid?
  end
  
  it "is invalid without an opinion" do
    assert !FactoryGirl.build(:notification, opinion: nil).valid?
  end
  
  it "is invalid without a kind" do
    assert !FactoryGirl.build(:notification, kind: nil).valid?
  end
end
