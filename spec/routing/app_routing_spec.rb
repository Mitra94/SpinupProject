require "rails_helper"

RSpec.describe "routes for apps", :type => :routing do

        it "create app" do
            expect(:get => "/apps/new").to route_to(
                      :controller => "apps",
                      :action => "new"
                    )
        end
        
        it "listing apps" do
            expect(:get => "/apps").to route_to(
                      :controller => "apps",
                      :action => "index"
                    )
        end
        
        it "show app" do
            expect(:get => "/apps/1").to route_to(
                      :controller => "apps",
                      :action => "show",
                      :id=>"1"
                    )
        end
        
        it "edit app" do
            expect(:get => "/apps/1/edit").to route_to(
                      :controller => "apps",
                      :action => "edit",
                      :id=>"1"
                    )
        end
        
        it "show app's followers" do
            expect(:get => "/apps/1/followers").to route_to(
                      :controller => "apps",
                      :action => "followers",
                      :id=>"1"
                    )
        end
        
        it "get random app" do
            expect(:get => "/random").to route_to(
                      :controller => "apps",
                      :action => "random"
                    )
        end
        
        it "get random app" do
            expect(:get => "/musthave").to route_to(
                      :controller => "apps",
                      :action => "musthave"
                    )
        end 
        
        it "get chosenforyou app" do
            expect(:get => "/chosenforyou").to route_to(
                      :controller => "apps",
                      :action => "chosenforyou"
                    )
        end 
        
        it "get appoftheday app" do
            expect(:get => "/appoftheday").to route_to(
                      :controller => "apps",
                      :action => "appoftheday"
                    )
        end 
        
        it "get fresh app" do
            expect(:get => "/freshapps").to route_to(
                      :controller => "apps",
                      :action => "fresh"
                    )
        end 

end
