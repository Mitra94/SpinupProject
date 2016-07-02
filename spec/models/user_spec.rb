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
  
  it "don' t following a app" do
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

end
