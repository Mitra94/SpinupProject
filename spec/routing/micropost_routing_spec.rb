require "rails_helper"

RSpec.describe "routes for microposts", :type => :routing do

        it "create micropost" do
            expect(:get => "apps/1/microposts/new").to route_to(
                      :controller => "microposts",
                      :action => "new",
                      :app_id =>"1"
                    )
        end
        
        it "listing microposts" do
            expect(:get => "apps/1/microposts").to route_to(
                      :controller => "microposts",
                      :action => "index",
                      :app_id =>"1"
                    )
        end
        
        it "show micropost" do
            expect(:get => "apps/1/microposts/1").to route_to(
                      :controller => "microposts",
                      :action => "show",
                      :app_id =>"1",
                      :id=>"1"
                    )
        end
        
        it "edit micropost" do
            expect(:get => "apps/1/microposts/1/edit").to route_to(
                      :controller => "microposts",
                      :action => "edit",
                      :app_id =>"1",
                      :id=>"1"
                    )
        end
        
end
