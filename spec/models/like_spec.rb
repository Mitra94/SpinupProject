require 'rails_helper'

RSpec.describe Like, type: :model do

  it "has none to begin with" do
    expect(Like.count).to eq 0
  end
  
  it "has a valid factory" do
    assert FactoryGirl.create(:like).valid?
  end
  
  it "has one after adding one" do
    rel = FactoryGirl.create(:like)
    expect(rel.save!).to eq true
  end
  
  it "is invalid without a liker" do
    assert !FactoryGirl.build(:like, liker: nil).valid?
  end
  
  it "is invalid without a liked" do
    assert !FactoryGirl.build(:like, liked: nil).valid?
  end
  
end
