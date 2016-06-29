class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update, :destroy, :lovers]

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
  
  #Loves Code
  def lovers
    @title = "Lovers"
    @comment  = Comment.find(params[:id])
    @users = @comment.lovers.paginate(page: params[:page])
    render 'show_lovers'
  end
  #End Loves Code
  
  private

  def comment_params
    params.require(:comment).permit(:content)
  end 

  def set_comment
    @comment = Comment.find(params[:id])
  end   
end
