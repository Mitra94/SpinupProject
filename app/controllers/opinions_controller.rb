class OpinionsController < ApplicationController

  def new
	@opinion = Opinion.new(params[:comment])
  end 
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @opinion = @micropost.opinions.build(opinion_params)
    @opinion.user_id = current_user.id
    @app = @micropost.app
    if @opinion.save
       flash[:success] = "Comment created!"
       redirect_to @app
    else
      flash[:error] = "Comment was not posted!"
      redirect_to @app
    end
  end
  
  private

  def opinion_params
    params.require(:opinion).permit(:content)
  end 
  
end
