require 'rails_helper'

RSpec.describe Rate, type: :model do

  it "has none to begin with" do
    expect(Rate.count).to eq 0
  end
  
  it "has a valid factory" do
    assert FactoryGirl.create(:rate).valid?
  end
  
  it "has one after adding one" do
    rel = FactoryGirl.create(:rate)
    expect(rel.save!).to eq true
  end
  
  it "is invalid without a rater" do
    assert !FactoryGirl.build(:rate, rater: nil).valid?
  end
  
  it "is invalid without a rateable" do
    assert !FactoryGirl.build(:rate, rateable: nil).valid?
  end
  
  it "is invalid without stars" do
    !FactoryGirl.build(:rate, stars: nil).valid?
  end
  
  it "is invalid with stars > 5" do
    !FactoryGirl.build(:rate, stars: "6").valid?
  end
  
  it "is valid with stars = 0" do
    FactoryGirl.build(:rate, stars: "0").valid?
  end
  
  it "is invalid with stars < 0" do
    !FactoryGirl.build(:rate, stars: "-1").valid?
  end
  
end
