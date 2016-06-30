class LikesController < ApplicationController

    def create
        micropost = Micropost.find(params[:liked_id])
        current_user.like(micropost)
        @app = micropost.app
        redirect_to @app
    end

    def destroy
        micropost = Like.find(params[:id]).liked
        current_user.unlike(micropost)
        @app = micropost.app
        redirect_to @app
    end

end
