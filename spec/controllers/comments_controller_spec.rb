require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

	before :each do
		@developer = FactoryGirl.create(:developer)
		sign_in @developer
		@micropost = FactoryGirl.create(:micropost)
		@app = FactoryGirl.create(:app)
	end
	describe "POST create" do
		context "with valid attributes" do
			it 'add one comment' do
				count = Comment.count
				@comment = FactoryGirl.create(:comment)
				post :create, comment: {developer: @comment.developer, content: @comment.content}, micropost_id: @micropost.id
				assert Comment.count > count
			end 	
			
			it "should create comment" do
				@comment = FactoryGirl.create(:comment)
				post :create, comment: {developer: @comment.developer, content: @comment.content}, micropost_id: @micropost.id
				assert_response :redirect
				expect(response).to redirect_to('/apps/1')
			end			
		end
		
		context "with invalid attributes" do
			it "does not save the comment without content" do
				count = Comment.count
				post :create, comment: { developer_id: "1", content: nil}, micropost_id: @micropost.id
				expect(Comment.count).to eq(count)
			end
			
			it "re-renders the new method" do
				post :create, comment: { developer_id: "1", content: nil}, micropost_id: @micropost.id
				expect(response).to redirect_to('/apps/1')
			end
		end
	end
	
	describe 'PUT update' do
		before :each do
			@comment = FactoryGirl.create(:comment)
		end		
		
		context "valid attributes" do
			it "located the requested @comment" do
				put :update, id: @comment, comment: { developer: @comment.developer, micropost: @comment.micropost, content: @comment.content }
				expect(assigns(:comment)).to eq(@comment)
			end

			it "changes @comment's attributes" do
				put :update, id: @comment,
				comment: { developer: @comment.developer, micropost: @comment.micropost, content: "Modified" }
				@comment.reload
				expect(@comment.content).to eq("Modified")
			end

			it "redirects to the updated comment" do
				put :update, id: @comment, comment: { developer: @comment.developer, micropost: @comment.micropost, content: "Modified" }
				expect(response).to redirect_to ('/apps/3')
			end
		end
		
		context "invalid attributes" do
			it "locates the requested @comment" do
				put :update, id: @comment, comment: { developer: @comment.developer, micropost: @comment.micropost, content: nil }
				expect(assigns(:comment)).to eq(@comment)
			end
			
			it "does not change @comment's attributes" do
				put :update, id: @comment,
				comment: { developer: @comment.developer, micropost: @comment.micropost, content: nil }
				@comment.reload
				expect(@comment.content).not_to eq("Modified")
			end
		end
	end	
	
	describe 'DELETE update' do
		before :each do
			@comment = FactoryGirl.create(:comment)
		end	
		
		it "should delete comment" do
			delete :destroy, :id => @comment.id
			assert_response :redirect
			expect(response).to redirect_to(root_path)
		end
	end
		
	private
	
	def sign_in(developer)
		session[:developer_id] = developer.id
		current_dev = developer
		@current_dev = developer
	end
	
	def sign_out
		current_dev = nil
		@current_dev = nil
		cookies.delete(:remember_token)
	end
	
	def signed_in?
		return !@current_dev.nil?
	end				
end
