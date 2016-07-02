require "rails_helper"

RSpec.describe "User management", :type => :request do

  it "after login redirect to the home page" do
    user = FactoryGirl.create(:user)
    visit "/login"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Log in"

    redirect_to '/home'
    
  end

end
