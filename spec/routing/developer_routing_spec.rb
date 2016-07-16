require "rails_helper"

RSpec.describe "routes for developers", :type => :routing do

        it "create developer" do
            expect(:get => "/developers/new").to route_to(
                      :controller => "developers",
                      :action => "new"
                    )
        end
        
        it "listing developers" do
            expect(:get => "/developers").to route_to(
                      :controller => "developers",
                      :action => "index"
                    )
        end
        
        it "show developer" do
            expect(:get => "/developers/1").to route_to(
                      :controller => "developers",
                      :action => "show",
                      :id=>"1"
                    )
        end
        
        it "edit developer" do
            expect(:get => "/developers/1/edit").to route_to(
                      :controller => "developers",
                      :action => "edit",
                      :id=>"1"
                    )
        end
end
