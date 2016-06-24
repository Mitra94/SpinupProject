class MicropostsController < ApplicationController

  def new
	@micropost = Micropost.new(params[:micropost])
  end 
  
  def create
    @micropost = current_dev.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to apps_path
    end
  end

  def destroy
  end
  
  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
