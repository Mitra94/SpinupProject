require "rails_helper"

RSpec.describe "routes for comment", :type => :routing do

        it "create comment" do
            expect(:get => "apps/1/microposts/1/comments/new").to route_to(
                      :controller => "comments",
                      :action => "new",
                      :app_id =>"1",
                      :micropost_id => "1"
                    )
        end
        
        it "listing comments" do
            expect(:get => "apps/1/microposts/1/comments").to route_to(
                      :controller => "comments",
                      :action => "index",
                      :app_id =>"1",
                      :micropost_id => "1"                      
                    )
        end
        
        it "show comment" do
            expect(:get => "apps/1/microposts/1/comments/1").to route_to(
                      :controller => "comments",
                      :action => "show",
                      :app_id =>"1",
                      :micropost_id => "1",                     
                      :id=>"1"
                    )
        end
        
        it "edit comment" do
            expect(:get => "apps/1/microposts/1/comments/1/edit").to route_to(
                      :controller => "comments",
                      :action => "edit",
                      :app_id =>"1",
                      :micropost_id => "1",                      
                      :id=>"1"
                    )
        end    
        
        it "show comment's lovers" do
            expect(:get => "/apps/1/microposts/1/comments/1/lovers").to route_to(
                      :controller => "comments",
                      :action => "lovers",
                      :app_id => "1",
                      :micropost_id => "1",
                      :id=>"1"
                    )
        end           
end
