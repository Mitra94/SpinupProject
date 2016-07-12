require 'rails_helper'

RSpec.describe Love, type: :model do

  it "has none to begin with" do
    expect(Love.count).to eq 0
  end
  
  it "has a valid factory" do
    assert FactoryGirl.create(:love).valid?
  end
  
  it "has one after adding one" do
    rel = FactoryGirl.create(:love)
    expect(rel.save!).to eq true
  end
  
  it "is invalid without a lover" do
    assert !FactoryGirl.build(:love, lover: nil).valid?
  end
  
  it "is invalid without a loved" do
    assert !FactoryGirl.build(:love, loved: nil).valid?
  end
  
end
