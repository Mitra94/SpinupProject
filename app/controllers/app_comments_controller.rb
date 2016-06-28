class AppCommentsController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @app_comment = @micropost.app_comments.create(app_comment_params)
    @app = micropost.app
    redirect_to @app
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
end
