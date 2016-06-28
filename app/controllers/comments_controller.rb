class CommentsController < ApplicationController

  def new
	@comment = Comment.new(params[:comment])
  end 
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.developer_id = current_dev.id
    @app = @micropost.app
    if @comment.save
       flash[:success] = "Comment created!"
       redirect_to @app
    else
      flash[:error] = "Comment was not posted!"
      redirect_to @app
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content)
  end 
  
end
