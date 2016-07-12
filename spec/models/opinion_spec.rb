require 'rails_helper'

RSpec.describe Opinion, type: :model do

  it "has a valid factory" do
    assert FactoryGirl.create(:opinion).valid?
  end
  
  it "has none to begin with" do
    expect(Opinion.count).to eq 0
  end
  
  it "has one after adding one" do
    opinion = FactoryGirl.create(:opinion)
    expect(opinion.save!).to eq true
  end
  
  it "is invalid without a developer" do
    assert !FactoryGirl.build(:opinion, user: nil).valid?
  end 
  
  it "is invalid without a micropost" do
    assert !FactoryGirl.build(:opinion, micropost: nil).valid?
  end 
  
  it "is invalid without a content" do
    assert !FactoryGirl.build(:opinion, content: nil).valid?
  end
    
  it "Content too long" do
    opinion = FactoryGirl.build(:opinion, content: ""*141)
    expect(opinion.valid?).to eq false
  end 
  
  it "is invalid without a content during the update" do
	opinion = FactoryGirl.build(:opinion) 
	opinion.update_attributes(:content => "") 
	expect(opinion.valid?).to eq false
  end    
end
