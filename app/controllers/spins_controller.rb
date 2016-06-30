class SpinsController < ApplicationController

    def create
		opinion = Opinion.find(params[:spined_id])
        current_user.spin(opinion)
        micropost = opinion.micropost
        @app = micropost.app
        redirect_to @app
    end

    def destroy
		opinion = Spin.find(params[:id]).spined
        current_user.unspin(opinion)
        micropost = opinion.micropost
        @app = micropost.app
        redirect_to @app
    end

end
