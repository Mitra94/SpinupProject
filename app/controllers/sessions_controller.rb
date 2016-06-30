class SessionsController < ApplicationController

    skip_before_filter :require_login, :only => [:new, :create, :createdev, :newdev]
    
  def new
  end
  
  def newdev
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    if user.admin?
      redirect_to login_admin_url
    else
	redirect_to user
	end
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def createdev
    dev = Developer.find_by(email: params[:session][:email].downcase)
    if dev && dev.authenticate(params[:session][:password])
      # Log the dev in and redirect to the dev's show page.
      log_in_dev dev
      params[:session][:remember_me] == '1' ? remember_dev(dev) : forget_dev(dev)
      redirect_to dev
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
  def destroydev
    log_out_dev if logged_in_dev?
    redirect_to root_url
  end
end
