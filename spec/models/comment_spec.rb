require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "has a valid factory" do
    assert FactoryGirl.create(:comment).valid?
  end
  
  it "has none to begin with" do
    expect(Comment.count).to eq 0
  end
  
  it "has one after adding one" do
    comment = FactoryGirl.create(:comment)
    expect(comment.save!).to eq true
  end
  
  it "is invalid without a developer" do
    assert !FactoryGirl.build(:comment, developer: nil).valid?
  end 
  
  it "is invalid without a micropost" do
    assert !FactoryGirl.build(:comment, micropost: nil).valid?
  end 
  
  it "is invalid without a content" do
    assert !FactoryGirl.build(:comment, content: nil).valid?
  end
    
  it "Content too long" do
    comment = FactoryGirl.build(:comment, content: ""*141)
    expect(comment.valid?).to eq false
  end 
  
  it "is invalid without a content during the update" do
	comment = FactoryGirl.build(:comment) 
	comment.update_attributes(:content => "") 
	expect(comment.valid?).to eq false
  end    
end
