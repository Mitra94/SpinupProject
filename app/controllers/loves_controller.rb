class LovesController < ApplicationController

    def create
		comment = Comment.find(params[:loved_id])
        current_user.love(comment)
        micropost = comment.micropost
        @app = micropost.app
        redirect_to @app
    end

    def destroy
		comment = Love.find(params[:id]).loved
        current_user.unlove(comment)
        micropost = comment.micropost
        @app = micropost.app
        redirect_to @app
    end

end
