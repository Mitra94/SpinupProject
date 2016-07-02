require 'rails_helper'

RSpec.describe Relationship, type: :model do

  it "has none to begin with" do
    expect(Relationship.count).to eq 0
  end
  
  it "has a valid factory" do
    assert FactoryGirl.create(:relationship).valid?
  end
  
  it "has one after adding one" do
    rel = FactoryGirl.create(:relationship)
    expect(rel.save!).to eq true
  end
  
  it "is invalid without a follower" do
    assert !FactoryGirl.build(:relationship, follower: nil).valid?
  end
  
  it "is invalid without a followed" do
    assert !FactoryGirl.build(:relationship, followed: nil).valid?
  end
  
end
