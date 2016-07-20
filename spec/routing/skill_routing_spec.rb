require 'rails_helper'


RSpec.describe "Skill routes", :type => :routing do 


	it "should show a skill" do

		expect(:get => "/skills/1").to route_to(
			:controller => "skills",
			:action => "show",
			:id => "1")

	end


	it "should show a skill(html+css)" do

		expect(:get => "/skills/1/show_htmlcss").to route_to(
			:controller => "skills",
			:action => "show_htmlcss",
			:id => "1")

	end


	it "should show a skill(java)" do

		expect(:get => "/skills/1/show_java").to route_to(
			:controller => "skills",
			:action => "show_java",
			:id => "1")

	end


	it "should show a skill(javascript)" do

		expect(:get => "/skills/1/show_javascript").to route_to(
			:controller => "skills",
			:action => "show_javascript",
			:id => "1")

	end

	it "should show a skill(c)" do

		expect(:get => "/skills/1/show_c").to route_to(
			:controller => "skills",
			:action => "show_c",
			:id => "1")

	end

	it "should show a skill(c++)" do

		expect(:get => "/skills/1/show_c_plus_plus").to route_to(
			:controller => "skills",
			:action => "show_c_plus_plus",
			:id => "1")

	end

	it "should show a skill(nodejs)" do

		expect(:get => "/skills/1/show_nodejs").to route_to(
			:controller => "skills",
			:action => "show_nodejs",
			:id => "1")

	end

	it "should show a skill(database)" do

		expect(:get => "/skills/1/show_database").to route_to(
			:controller => "skills",
			:action => "show_database",
			:id => "1")

	end

	it "should show a skill(algorithms)" do

		expect(:get => "/skills/1/show_algorithms").to route_to(
			:controller => "skills",
			:action => "show_algorithms",
			:id => "1")

	end

	it "should show a skill(android)" do

		expect(:get => "/skills/1/show_android").to route_to(
			:controller => "skills",
			:action => "show_android",
			:id => "1")

	end

	it "should show a skill(ios)" do

		expect(:get => "/skills/1/show_ios").to route_to(
			:controller => "skills",
			:action => "show_ios",
			:id => "1")

	end

	it "should create a skill" do

		expect(:get =>"/skills/new").to route_to(
			:controller => "skills",
			:action => "new")

	end

	it "should edit a skill" do

		expect(:get => "skills/1/edit").to route_to(
			:controller => "skills",
			:action => "edit",
			:id => "1")

	end

	it "should edit a skill(html+css)" do

		expect(:get => "skills/1/edit_htmlcss").to route_to(
			:controller => "skills",
			:action => "edit_htmlcss",
			:id => "1")

	end


	it "should edit a skill(java)" do

		expect(:get => "skills/1/edit_java").to route_to(
			:controller => "skills",
			:action => "edit_java",
			:id => "1")

	end

	it "should edit a skill(javascript)" do

		expect(:get => "skills/1/edit_javascript").to route_to(
			:controller => "skills",
			:action => "edit_javascript",
			:id => "1")

	end

	it "should edit a skill(c)" do

		expect(:get => "skills/1/edit_c").to route_to(
			:controller => "skills",
			:action => "edit_c",
			:id => "1")

	end

	it "should edit a skill(c++)" do

		expect(:get => "skills/1/edit_cplus").to route_to(
			:controller => "skills",
			:action => "edit_cplus",
			:id => "1")

	end

	it "should edit a skill(nodejs)" do

		expect(:get => "skills/1/edit_nodejs").to route_to(
			:controller => "skills",
			:action => "edit_nodejs",
			:id => "1")

	end

	it "should edit a skill(database)" do

		expect(:get => "skills/1/edit_database").to route_to(
			:controller => "skills",
			:action => "edit_database",
			:id => "1")

	end

	it "should edit a skill(algorithms)" do

		expect(:get => "skills/1/edit_algorithms").to route_to(
			:controller => "skills",
			:action => "edit_algorithms",
			:id => "1")

	end

	it "should edit a skill(android)" do

		expect(:get => "skills/1/edit_android").to route_to(
			:controller => "skills",
			:action => "edit_android",
			:id => "1")

	end

	it "should edit a skill(ios)" do

		expect(:get => "skills/1/edit_ios").to route_to(
			:controller => "skills",
			:action => "edit_ios",
			:id => "1")

	end

	it "should go to search page" do

		expect(:get => "skills/1/search").to route_to(
			:controller => "skills",
			:action => "search",
			:id => "1")

	end

	it "should go to results page" do

		expect(:get => "results").to route_to(
			:controller => "skills",
			:action => "results")

	end

	it "should update a skill" do

		expect(:patch => "skills/1").to route_to(
			:controller => "skills",
			:action => "update",
			:id => "1")

	end

end