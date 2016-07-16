require "rails_helper"

RSpec.describe "User management", :type => :request do
  
  it "after signup redirect to the home page" do
    visit "/signup/user"
    fill_in "Username", :with => "tonno"
    fill_in "Email", :with => "tonno@gmail.com"
    fill_in "Password", :with => "canecane"
    fill_in "Confirmation", :with => "canecane"
    click_button "Create my account"

    expect(current_path).to eq(home_path)
    
  end
  
  it "invalid signup (username too short)" do
  
    visit "/signup/user"
    fill_in "Username", :with => "A"
    fill_in "Email", :with => "melideo@gmail.com"
    fill_in "Password", :with => "muromuro"
    fill_in "Confirmation", :with => "muromuro"
    click_button "Create my account"

    expect(current_path).to eq "/users"
    expect(page).to have_content "Username is too short (minimum is 2 characters)"
    
  end
  
  it "logout -> signin, login -> home " do
    visit "/signup/user"
    fill_in "Username", :with => "tonno"
    fill_in "Email", :with => "tonno@gmail.com"
    fill_in "Password", :with => "canecane"
    fill_in "Confirmation", :with => "canecane"
    click_button "Create my account"

    visit "/logout"
    expect(current_path).to eq(login_path)
    
    visit "/login"
    fill_in "Email", :with => "tonno@gmail.com"
    fill_in "Password", :with => "canecane"
    click_button "Log in"

    expect(current_path).to eq(home_path)
  end

end
