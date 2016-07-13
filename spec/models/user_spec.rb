require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a valid factory" do
    assert FactoryGirl.create(:user).valid?
  end

  it "has none to begin with" do
    expect(User.count).to eq 0
  end

  it "has one after adding one" do
    user = FactoryGirl.create(:user)
    expect(user.save!).to eq true
  end
  
  it "Password too short" do
    user = FactoryGirl.build(:user, 
                 password: "dude", password_confirmation: "dude")
    expect(user.valid?).to eq false
  end
  
  it "Username too long" do
    user = FactoryGirl.build(:user, username: ""*51)
    expect(user.valid?).to eq false
  end
  
  it "Username uniqness" do
    user = FactoryGirl.create(:user) 
    user.save!
    user2 = FactoryGirl.create(:user) 
    user2.username = user.username
    expect(user2.valid?).to eq false
  end
  
  it "Invalid email" do
    user =FactoryGirl.build(:user, email: "invalid")
    expect(user.valid?).to eq false
  end
  
  it "Email uniqness" do
    user = FactoryGirl.create(:user) 
    user.save!
    user2 = FactoryGirl.create(:user) 
    user2.email = user.email
    expect(user2.valid?).to eq false
  end
  
  it "email validation should accept valid addresses" do
    @user = FactoryGirl.create(:user) 
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  
  it "is invalid without a username" do
    assert !FactoryGirl.build(:user, username: nil).valid?
  end
  
  it "is invalid without a email" do
    assert !FactoryGirl.build(:user, email: nil).valid?
  end
  
  it "is invalid without a password" do
    assert !FactoryGirl.build(:user, password: nil).valid?
  end
  
  it "is invalid without a password_confirmation" do
    assert !FactoryGirl.build(:user, password_confirmation: nil).valid?
  end
  
  it "don't following a app" do
    user = FactoryGirl.create(:user)
    app = FactoryGirl.create(:app)
    assert !user.following?(app)
  end
  
  it "should follow a app" do
    user = FactoryGirl.create(:user)
    app = FactoryGirl.create(:app)
    user.follow(app)
    assert user.following?(app)
  end
  
  it "should unfollow a app" do
    user = FactoryGirl.create(:user)
    app = FactoryGirl.create(:app)
    user.follow(app)
    user.unfollow(app)
    assert !user.following?(app)
  end
  
  it "should include a user in app's followers" do
    user = FactoryGirl.create(:user)
    app = FactoryGirl.create(:app)
    user.follow(app)
    assert app.followers.include?(user)
  end

  #Start like tests
  it "don't like a micropost" do
    user = FactoryGirl.create(:user)
    micropost = FactoryGirl.create(:micropost)
    assert !user.likes?(micropost)
  end

  it "should like a micropost" do
    user = FactoryGirl.create(:user)
    micropost = FactoryGirl.create(:micropost)
    user.like(micropost)
    assert user.likes?(micropost)
  end  	
  
  it "should unlike a micropost" do
    user = FactoryGirl.create(:user)
    micropost = FactoryGirl.create(:micropost)
    user.like(micropost)
    user.unlike(micropost)
    assert !user.likes?(micropost)
  end
  
  it "should include a user in micropost's likers" do
    user = FactoryGirl.create(:user)
    micropost = FactoryGirl.create(:micropost)
    user.like(micropost)
    assert micropost.likers.include?(user)
  end  
  #End like tests
  
  #Start love tests
  it "don't love a comment" do
    user = FactoryGirl.create(:user)
    comment = FactoryGirl.create(:comment)
    assert !user.loves?(comment)
  end

  it "should love a comment" do
    user = FactoryGirl.create(:user)
    comment = FactoryGirl.create(:comment)
    user.love(comment)
    assert user.loves?(comment)
  end  	
  
  it "should unlove a comment" do
    user = FactoryGirl.create(:user)
    comment = FactoryGirl.create(:comment)
    user.love(comment)
    user.unlove(comment)
    assert !user.loves?(comment)
  end
  
  it "should include a user in comment's lovers" do
    user = FactoryGirl.create(:user)
    comment = FactoryGirl.create(:comment)
    user.love(comment)
    assert comment.lovers.include?(user)
  end  
  #End love tests 
  
  #Start spin tests
  it "don't love a opinion" do
    user = FactoryGirl.create(:user)
    opinion = FactoryGirl.create(:opinion)
    assert !user.spins?(opinion)
  end

  it "should love a opinion" do
    user = FactoryGirl.create(:user)
    opinion = FactoryGirl.create(:opinion)
    user.spin(opinion)
    assert user.spins?(opinion)
  end  	
  
  it "should unlove a opinion" do
    user = FactoryGirl.create(:user)
    opinion = FactoryGirl.create(:opinion)
    user.spin(opinion)
    user.unspin(opinion)
    assert !user.spins?(opinion)
  end
  
  it "should include a user in opinion's spiners" do
    user = FactoryGirl.create(:user)
    opinion = FactoryGirl.create(:opinion)
    user.spin(opinion)
    assert opinion.spiners.include?(user)
  end  
  #End spin tests   
  
  it "is invalid without a username during the update" do
	user = FactoryGirl.build(:user) 
	user.update_attributes(:username => nil) 
	expect(user.valid?).to eq false
  end 
  
  it "is invalid without a email during the update" do
	user = FactoryGirl.build(:user) 
	user.update_attributes(:email => nil) 
	expect(user.valid?).to eq false
  end
 
  it "is invalid without a password during the update" do
	user = FactoryGirl.build(:user) 
	user.update_attributes(:password => nil) 
	expect(user.valid?).to eq false
  end
  
  it "is invalid without a password_confirmation during the update" do
	user = FactoryGirl.build(:user) 
	user.update_attributes(:password_confirmation => nil) 
	expect(user.valid?).to eq false
  end       
end
