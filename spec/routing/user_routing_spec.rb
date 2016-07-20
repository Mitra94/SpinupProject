require "rails_helper"

RSpec.describe "routes for users", :type => :routing do

        it "create user" do
            expect(:get => "/users/new").to route_to(
                      :controller => "users",
                      :action => "new"
                    )
        end
        
        it "listing users" do
            expect(:get => "/users").to route_to(
                      :controller => "users",
                      :action => "index"
                    )
        end
        
        it "show user" do
            expect(:get => "/users/1").to route_to(
                      :controller => "users",
                      :action => "show",
                      :id=>"1"
                    )
        end
        
        it "edit user" do
            expect(:get => "/users/1/edit").to route_to(
                      :controller => "users",
                      :action => "edit",
                      :id=>"1"
                    )
        end
        
        it "show users's following" do
            expect(:get => "/users/1/following").to route_to(
                      :controller => "users",
                      :action => "following",
                      :id=>"1"
                    )
        end  
        
        it "show users's likes" do
            expect(:get => "/users/1/likes").to route_to(
                      :controller => "users",
                      :action => "likes",
                      :id=>"1"
                    )
        end           
        
        it "show users's spins" do
            expect(:get => "/users/1/spins").to route_to(
                      :controller => "users",
                      :action => "spins",
                      :id=>"1"
                    )
        end
        
        it "show users's loves" do
            expect(:get => "/users/1/loves").to route_to(
                      :controller => "users",
                      :action => "loves",
                      :id=>"1"
                    )
        end        
end
