require 'rails_helper'

RSpec.describe Developer, type: :model do

  it "has a valid factory" do
    assert FactoryGirl.create(:developer).valid?
  end
  
  it "has none to begin with" do
    expect(Developer.count).to eq 0
  end
  
  it "has one after adding one" do
    developer = FactoryGirl.create(:developer)
    expect(developer.save!).to eq true
  end
  
  it "Password too short" do
    user = FactoryGirl.build(:developer, 
                 password: "dude", password_confirmation: "dude")
    expect(user.valid?).to eq false
  end
  
  it "Name too short" do
    user = FactoryGirl.build(:developer, name: "tu")
    expect(user.valid?).to eq false
  end
  
  it "Name too long" do
    user = FactoryGirl.build(:developer, name: ""*51)
    expect(user.valid?).to eq false
  end
  
  it "Surname too short" do
    user = FactoryGirl.build(:developer, surname: "tu")
    expect(user.valid?).to eq false
  end
  
  it "Surname too long" do
    user = FactoryGirl.build(:developer, surname: ""*51)
    expect(user.valid?).to eq false
  end
  
  it "City too short" do
    user = FactoryGirl.build(:developer, city: "t")
    expect(user.valid?).to eq false
  end
  
  it "City too long" do
    user = FactoryGirl.build(:developer, city: ""*51)
    expect(user.valid?).to eq false
  end
  
  it "Age should be greater than 0" do
    user = FactoryGirl.build(:developer, age: 0)
    expect(user.valid?).to eq false
  end
  
  it "Age should be smaller than 101" do
    user = FactoryGirl.build(:developer, age: 101)
    expect(user.valid?).to eq false
  end
  
  it "Invalid email" do
    user =FactoryGirl.build(:developer, email: "invalid")
    expect(user.valid?).to eq false
  end
  
  it "Email uniqness" do
    user = FactoryGirl.create(:developer) 
    user.save!
    user2 = FactoryGirl.create(:developer) 
    user2.email = user.email
    expect(user2.valid?).to eq false
  end
  
  it "email validation should accept valid addresses" do
    user = FactoryGirl.create(:developer) 
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      assert user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  
  it "is invalid without a name" do
    assert !FactoryGirl.build(:developer, name: nil).valid?
  end
  
  it "is invalid without a surname" do
    assert !FactoryGirl.build(:developer, surname: nil).valid?
  end
  
  it "is invalid without a email" do
    assert !FactoryGirl.build(:developer, email: nil).valid?
  end
  
  it "is invalid without a city" do
    assert !FactoryGirl.build(:developer, city: nil).valid?
  end
  
  it "is invalid without age" do
    assert !FactoryGirl.build(:developer, age: nil).valid?
  end
  
  it "is invalid without a password" do
    assert !FactoryGirl.build(:developer, password: nil).valid?
  end
  
  it "is invalid without a password_confirmation" do
    assert !FactoryGirl.build(:developer, password_confirmation: nil).valid?
  end
  
  it "is invalid without a name during the update" do
	developer = FactoryGirl.build(:developer) 
	developer.update_attributes(:name => nil) 
	expect(developer.valid?).to eq false
  end
  
  it "is invalid without a surname during the update" do
	developer = FactoryGirl.build(:developer) 
	developer.update_attributes(:surname => nil) 
	expect(developer.valid?).to eq false
  end  
  
  it "is invalid without a email during the update" do
	developer = FactoryGirl.build(:developer) 
	developer.update_attributes(:email => nil) 
	expect(developer.valid?).to eq false
  end
  
  it "is invalid without a city during the update" do
	developer = FactoryGirl.build(:developer) 
	developer.update_attributes(:city => nil) 
	expect(developer.valid?).to eq false
  end  
  
  it "is invalid without a age during the update" do
	developer = FactoryGirl.build(:developer) 
	developer.update_attributes(:age => nil) 
	expect(developer.valid?).to eq false
  end  
 
  it "is invalid without a password during the update" do
	developer = FactoryGirl.build(:developer) 
	developer.update_attributes(:password => nil) 
	expect(developer.valid?).to eq false
  end
  
  it "is invalid without a password_confirmation during the update" do
	developer = FactoryGirl.build(:developer) 
	developer.update_attributes(:password_confirmation => nil) 
	expect(developer.valid?).to eq false
  end    
end
