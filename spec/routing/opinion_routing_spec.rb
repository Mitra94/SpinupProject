require "rails_helper"

RSpec.describe "routes for opinion", :type => :routing do

        it "create opinion" do
            expect(:get => "apps/1/microposts/1/opinions/new").to route_to(
                      :controller => "opinions",
                      :action => "new",
                      :app_id =>"1",
                      :micropost_id => "1"
                    )
        end
        
        it "listing opinion" do
            expect(:get => "apps/1/microposts/1/opinions").to route_to(
                      :controller => "opinions",
                      :action => "index",
                      :app_id =>"1",
                      :micropost_id => "1"                      
                    )
        end
        
        it "show opinion" do
            expect(:get => "apps/1/microposts/1/opinions/1").to route_to(
                      :controller => "opinions",
                      :action => "show",
                      :app_id =>"1",
                      :micropost_id => "1",                     
                      :id=>"1"
                    )
        end
        
        it "edit opinion" do
            expect(:get => "apps/1/microposts/1/opinions/1/edit").to route_to(
                      :controller => "opinions",
                      :action => "edit",
                      :app_id =>"1",
                      :micropost_id => "1",                      
                      :id=>"1"
                    )
        end     
        
        it "show opinion's spiners" do
                    expect(:get => "apps/1/microposts/1/opinions/1/spiners").to route_to(
                      :controller => "opinions",
                      :action => "spiners",
                      :app_id =>"1",
                      :micropost_id => "1",   
                      :id=>"1"                   
                    )
        end     
end
