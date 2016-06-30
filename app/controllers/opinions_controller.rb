class OpinionsController < ApplicationController

  before_action :set_opinion, only: [:show, :edit, :update, :destroy, :spiners]
  
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
  
  def destroy
    @opinion = Opinion.find(params[:id])
    @opinion.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end
  
  def edit
    @opinion = Opinion.find(params[:id])
  end

  def update
    @opinion = Opinion.find(params[:id])
    @micropost = @opinion.micropost
    @app = @micropost.app
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to @app, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  #Like Comments Code
  def spiners
    @title = "Spiners"
    @opinion  = Opinion.find(params[:id])
    @users = @opinion.spiners.paginate(page: params[:page])
    render 'show_spiners'
  end
  #End Like Comments Code
  
  private

  def opinion_params
    params.require(:opinion).permit(:content)
  end 
  
  def set_opinion
    @opinion = Opinion.find(params[:id])
  end   
end
