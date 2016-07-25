require "rails_helper"

RSpec.describe "Developer management", :type => :request do
  
  it "after signup redirect to the home page" do
    visit "/signup/developer"
    #dev = FactoryGirl.create(:developer)
    fill_in "Name", :with => "Andrea"
    fill_in "Surname", :with => "Melideo"
    fill_in "City", :with => "Rome"
    fill_in "Age", :with => 2
    fill_in "Email", :with => "melideo@gmail.com"
    fill_in "Password", :with => "muromuro"
    fill_in "Confirmation", :with => "muromuro"
    click_button "Create Developer"

    expect(current_path).to eq "/skills/1/edit"
    #expect(page).to have_content "Now let's set up your skills"
    #expect(page).to have_css("h1", text: "Now let's set up your skills")
    
  end
  
  it "invalid signup (name too short)" do
    visit "/signup/developer"
    #dev = FactoryGirl.create(:developer)
    fill_in "Name", :with => "A"
    fill_in "Surname", :with => "Melideo"
    fill_in "City", :with => "Rome"
    fill_in "Age", :with => 2
    fill_in "Email", :with => "melideo@gmail.com"
    fill_in "Password", :with => "muromuro"
    fill_in "Confirmation", :with => "muromuro"
    click_button "Create Developer"

    expect(current_path).to eq "/developers"
    expect(page).to have_content "Name is too short (minimum is 3 characters)"
    #expect(page).to have_css("h1", text: "Now let's set up your skills")
    
  end
  
  it "invalid signup (surbname too short)" do
    visit "/signup/developer"
    #dev = FactoryGirl.create(:developer)
    fill_in "Name", :with => "Andrea"
    fill_in "Surname", :with => "Me"
    fill_in "City", :with => "Rome"
    fill_in "Age", :with => 2
    fill_in "Email", :with => "melideo@gmail.com"
    fill_in "Password", :with => "muromuro"
    fill_in "Confirmation", :with => "muromuro"
    click_button "Create Developer"

    expect(current_path).to eq "/developers"
    expect(page).to have_content "Surname is too short (minimum is 3 characters)"
    #expect(page).to have_css("h1", text: "Now let's set up your skills")
    
  end
  
  it "invalid signup (age < 0)" do
    visit "/signup/developer"
    #dev = FactoryGirl.create(:developer)
    fill_in "Name", :with => "Andrea"
    fill_in "Surname", :with => "Melideo"
    fill_in "City", :with => "Rome"
    fill_in "Age", :with => -1
    fill_in "Email", :with => "melideo@gmail.com"
    fill_in "Password", :with => "muromuro"
    fill_in "Confirmation", :with => "muromuro"
    click_button "Create Developer"

    expect(current_path).to eq "/developers"
    expect(page).to have_content "Age must be greater than or equal to 1"
    #expect(page).to have_css("h1", text: "Now let's set up your skills")
    
  end
  
  it "invalid signup (age > 100)" do
    visit "/signup/developer"
    #dev = FactoryGirl.create(:developer)
    fill_in "Name", :with => "Andrea"
    fill_in "Surname", :with => "Melideo"
    fill_in "City", :with => "Rome"
    fill_in "Age", :with => 101
    fill_in "Email", :with => "melideo@gmail.com"
    fill_in "Password", :with => "muromuro"
    fill_in "Confirmation", :with => "muromuro"
    click_button "Create Developer"

    expect(current_path).to eq "/developers"
    expect(page).to have_content "Age must be less than or equal to 100"
    #expect(page).to have_css("h1", text: "Now let's set up your skills")
    
  end
  
  it "invalid signup (Password confirmation doesn't match Password)" do
    visit "/signup/developer"
    #dev = FactoryGirl.create(:developer)
    fill_in "Name", :with => "Andrea"
    fill_in "Surname", :with => "Melideo"
    fill_in "City", :with => "Rome"
    fill_in "Age", :with => 101
    fill_in "Email", :with => "melideo@gmail.com"
    fill_in "Password", :with => "muromuro"
    fill_in "Confirmation", :with => "muromuromuro"
    click_button "Create Developer"

    expect(current_path).to eq "/developers"
    expect(page).to have_content "Password confirmation doesn't match Password"
    #expect(page).to have_css("h1", text: "Now let's set up your skills")
    
  end
  
  it "logout -> signin, login -> home " do
    visit "/signup/developer"
    fill_in "Name", :with => "Andrea"
    fill_in "Surname", :with => "Melideo"
    fill_in "City", :with => "Rome"
    fill_in "Age", :with => 2
    fill_in "Email", :with => "melideo@gmail.com"
    fill_in "Password", :with => "muromuro"
    fill_in "Confirmation", :with => "muromuro"
    click_button "Create Developer"
    
    visit "/logoutdev"
    expect(current_path).to eq(login_path)
    
    visit "/logindev"
    fill_in "Email", :with => "melideo@gmail.com"
    fill_in "Password", :with => "muromuro"
    click_button "Spin in"

    expect(current_path).to eq(home_path)
  end

end
