require 'rails_helper'

RSpec.describe Spin, type: :model do

  it "has none to begin with" do
    expect(Spin.count).to eq 0
  end
  
  it "has a valid factory" do
    assert FactoryGirl.create(:spin).valid?
  end
  
  it "has one after adding one" do
    rel = FactoryGirl.create(:spin)
    expect(rel.save!).to eq true
  end
  
  it "is invalid without a spiner" do
    assert !FactoryGirl.build(:spin, spiner: nil).valid?
  end
  
  it "is invalid without a spined" do
    assert !FactoryGirl.build(:spin, spined: nil).valid?
  end
  
end
