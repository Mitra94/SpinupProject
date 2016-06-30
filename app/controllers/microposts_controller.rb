class MicropostsController < ApplicationController

  before_action :set_micropost, only: [:show, :edit, :update, :destroy, :likers]
  
  def new
	@micropost = Micropost.new(params[:micropost])
  end 
  
  def create
    @app = App.find(params[:app_id])
    @micropost = @app.microposts.build(micropost_params)
    @micropost.developer_id = current_dev.id 
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to @app
    else
      flash[:error] = "Micropost was not posted!"
      redirect_to @app
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end
  
  def edit
    @app = App.find(params[:app_id])
    @micropost = @app.microposts.find(params[:id])
  end

  def update
    @app = App.find(params[:app_id])
    @micropost = @app.microposts.find(params[:id])
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to @app, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end
  
  #Likes Code
  def likers
    @title = "Likers"
    @micropost  = Micropost.find(params[:id])
    @users = @micropost.likers.paginate(page: params[:page])
    render 'show_likers'
  end
  #End Likes Code
  
  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end
  
  def set_micropost
    @micropost = Micropost.find(params[:id])
  end 
end
