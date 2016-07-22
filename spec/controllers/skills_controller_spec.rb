require 'rails_helper'

RSpec.describe SkillsController, type: :controller do

	before :each do
		@developer = FactoryGirl.create(:developer)
		sign_in @developer

	end

	it "should show skill object" do

		skill = FactoryGirl.create(:skill)
		get :show, :id => skill.id
		assert_response :success
		expect(response).to render_template(:show)

	end


	it "should show html+css object" do

		skill = FactoryGirl.create(:skill)
		get :show_htmlcss, :id => skill.id
		assert_response :success
		expect(response).to render_template(:show_htmlcss)


	end


	it "should show java object" do

		skill = FactoryGirl.create(:skill)
		get :show_java, :id => skill.id
		assert_response :success
		expect(response).to render_template(:show_java)


	end

	it "should show javascript object" do

		skill = FactoryGirl.create(:skill)
		get :show_javascript, :id => skill.id
		assert_response :success
		expect(response).to render_template(:show_javascript)


	end

	it "should show c object" do

		skill = FactoryGirl.create(:skill)
		get :show_c, :id => skill.id
		assert_response :success
		expect(response).to render_template(:show_c)


	end

	it "should show c++ object" do

		skill = FactoryGirl.create(:skill)
		get :show_c_plus_plus, :id => skill.id
		assert_response :success
		expect(response).to render_template(:show_c_plus_plus)


	end

	it "should show nodejs object" do

		skill = FactoryGirl.create(:skill)
		get :show_nodejs, :id => skill.id
		assert_response :success
		expect(response).to render_template(:show_nodejs)


	end

	it "should show database object" do

		skill = FactoryGirl.create(:skill)
		get :show_database, :id => skill.id
		assert_response :success
		expect(response).to render_template(:show_database)


	end

	it "should show algorithms object" do

		skill = FactoryGirl.create(:skill)
		get :show_algorithms, :id => skill.id
		assert_response :success
		expect(response).to render_template(:show_algorithms)


	end

	it "should show android object" do

		skill = FactoryGirl.create(:skill)
		get :show_android, :id => skill.id
		assert_response :success
		expect(response).to render_template(:show_android)


	end


	it "should show ios object" do

		skill = FactoryGirl.create(:skill)
		get :show_ios, :id => skill.id
		assert_response :success
		expect(response).to render_template(:show_ios)


	end


	it "should create a new object" do

		skill = Skill.new
		assert skill.valid?

	end


	it "should go to edit page" do

		skill = FactoryGirl.create(:skill)
		get :edit, :id => skill.id
		assert_response :success
		expect(response).to render_template(:edit)

	end

	it "should edit html+css" do

		skill = FactoryGirl.create(:skill)
		get :edit_htmlcss, :id => skill.id
		assert_response :success
		expect(response).to render_template(:edit_htmlcss)

	end

	it "should edit java" do

		skill = FactoryGirl.create(:skill)
		get :edit_java, :id => skill.id
		assert_response :success
		expect(response).to render_template(:edit_java)

	end

	it "should edit javascript" do

		skill = FactoryGirl.create(:skill)
		get :edit_javascript, :id => skill.id
		assert_response :success
		expect(response).to render_template(:edit_javascript)

	end

	it "should edit c" do

		skill = FactoryGirl.create(:skill)
		get :edit_c, :id => skill.id
		assert_response :success
		expect(response).to render_template(:edit_c)

	end

	it "should edit c++" do

		skill = FactoryGirl.create(:skill)
		get :edit_cplus, :id => skill.id
		assert_response :success
		expect(response).to render_template(:edit_cplus)

	end

	it "should edit nodejs" do

		skill = FactoryGirl.create(:skill)
		get :edit_nodejs, :id => skill.id
		assert_response :success
		expect(response).to render_template(:edit_nodejs)

	end

	it "should edit database" do

		skill = FactoryGirl.create(:skill)
		get :edit_database, :id => skill.id
		assert_response :success
		expect(response).to render_template(:edit_database)

	end

	it "should edit algorithms" do

		skill = FactoryGirl.create(:skill)
		get :edit_algorithms, :id => skill.id
		assert_response :success
		expect(response).to render_template(:edit_algorithms)

	end

	it "should edit android" do

		skill = FactoryGirl.create(:skill)
		get :edit_android, :id => skill.id
		assert_response :success
		expect(response).to render_template(:edit_android)

	end

	it "should edit ios" do

		skill = FactoryGirl.create(:skill)
		get :edit_ios, :id => skill.id
		assert_response :success
		expect(response).to render_template(:edit_ios)

	end

	it "should go to search" do

		skill = FactoryGirl.create(:skill)
		get :search, :id => skill.id
		assert_response :success
		expect(response).to render_template(:search)

	end

	it "should go to results" do

		skill = FactoryGirl.create(:skill)
		get :results, :id => skill.id
		assert_response :success
		expect(response).to render_template(:results)

	end

	it "should create a skill" do

		expect{Skill.create(:html_css => 0, :java => 0, :javascript => 0, :c => 0, :c_plus_plus => 0, :nodejs => 0, :database => 0, :algorithms => 0, :android => 0, :ios => 0)}.to change(Skill, :count)

	end


	it "should update a skill" do


		skill = Skill.create(:html_css => 0, :java => 0, :javascript => 0, :c => 0, :c_plus_plus => 0, :nodejs => 0, :database => 0, :algorithms => 0, :android => 0, :ios => 0)
		put :update, :id => skill.id, :skill => skill.attributes = {:html_css => 10}
		assert_response :redirect
		expect(response).to redirect_to(developer_path(@developer))
		skill.reload
		assert skill.html_css == 10

	end


	private

	def sign_in(developer)
		session[:developer_id] = developer.id
		current_developer = developer
		@current_developer = developer
	end

	def sign_out
		current_developer = nil
		@current_developer = nil
		cookies.delete(:remember_token)
	end

	def signed_in?
		return !@current_developer.nil?
	end

end
