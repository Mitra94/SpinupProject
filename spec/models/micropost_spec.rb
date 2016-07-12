require 'rails_helper'

RSpec.describe Micropost, type: :model do

  it "has a valid factory" do
    assert FactoryGirl.create(:micropost).valid?
  end
  
  it "has none to begin with" do
    expect(Micropost.count).to eq 0
  end
  
  it "has one after adding one" do
    micropost = FactoryGirl.create(:micropost)
    expect(micropost.save!).to eq true
  end
  
  it "is invalid without a developer" do
    assert !FactoryGirl.build(:micropost, developer: nil).valid?
  end 
  
  it "is invalid without a app" do
    assert !FactoryGirl.build(:micropost, app: nil).valid?
  end 
  
  it "is invalid without a content" do
    assert !FactoryGirl.build(:micropost, content: nil).valid?
  end
  
  it "is invalid without a app_version" do
    assert !FactoryGirl.build(:micropost, app_version: nil).valid?
  end  
  
  it "Content too long" do
    micropost = FactoryGirl.build(:micropost, content: ""*141)
    expect(micropost.valid?).to eq false
  end 
  
  it "is invalid without a content during the update" do
	micropost = FactoryGirl.build(:micropost) 
	micropost.update_attributes(:content => "") 
	expect(micropost.valid?).to eq false
  end   
end
