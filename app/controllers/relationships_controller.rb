class RelationshipsController < ApplicationController

    def create
        app = App.find(params[:followed_id])
        current_user.follow(app)
        redirect_to app
    end

    def destroy
        app = Relationship.find(params[:id]).followed
        current_user.unfollow(app)
        redirect_to app
    end

end
