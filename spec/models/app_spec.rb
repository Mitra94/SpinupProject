require 'rails_helper'

RSpec.describe App, type: :model do

  it "has a valid factory" do
    assert FactoryGirl.create(:app).valid?
  end
    
  it "has none to begin with" do
    expect(App.count).to eq 0
  end
  
  it "has one after adding one" do
    app = FactoryGirl.create(:app)
    expect(app.save!).to eq true
  end
  
  it "is invalid without a name" do
    assert !FactoryGirl.build(:app, name: nil).valid?
  end
  
  it "is invalid without a platform" do
    assert !FactoryGirl.build(:app, platform: nil).valid?
  end
  
  it "is invalid without a category" do
    assert !FactoryGirl.build(:app, category: nil).valid?
  end
  
  it "is invalid without a version" do
    assert !FactoryGirl.build(:app, version: nil).valid?
  end
  
  it "is invalid with a name too long" do
    assert !FactoryGirl.build(:app, name: "a"*51).valid?
  end
  
  it "name should be unique" do
    user = FactoryGirl.create(:app)
    assert !FactoryGirl.build(:app, name: user.name).valid?
  end
  
  it "Name too long" do
    app = FactoryGirl.build(:app, name: ""*51)
    expect(app.valid?).to eq false
  end
  
  it "is invalid without a name during the update" do
	app = FactoryGirl.build(:app) 
	app.update_attributes(:name => nil) 
	expect(app.valid?).to eq false
  end
  
  it "is invalid without a platform during the update" do
	app = FactoryGirl.build(:app) 
	app.update_attributes(:platform => nil) 
	expect(app.valid?).to eq false
  end  
  
  it "is invalid without a category during the update" do
	app = FactoryGirl.build(:app) 
	app.update_attributes(:category => nil) 
	expect(app.valid?).to eq false
  end
  
  it "is invalid without a version during the update" do
	app = FactoryGirl.build(:app) 
	app.update_attributes(:version => nil) 
	expect(app.valid?).to eq false
  end
end
