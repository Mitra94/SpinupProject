require 'rails_helper'

RSpec.describe App, type: :model do
  
  it "has none to begin with" do
    expect(App.count).to eq 0
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
  
end
