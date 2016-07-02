class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :following, :likes, :spins, :loves]
  before_action :admin_user,     only: :destroy
  before_action :require_admin, only: :index
  
  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @categories = [['Game', 'Game'], ['Photo', 'Photo'], ['Family', 'Family'], ['Music', 'Music'], ['Shopping', 'Shopping'], ['Social', 'Social'], ['Communication', 'Communication']]
  end
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @apps = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end
  
  #Likes Code
  def likes
    @title = "Likes"
    @user  = User.find(params[:id])
    @microposts = @user.likes.paginate(page: params[:page])
    render 'show_follow'
  end
  #End Likes Code
  
  #Like Opinions Code
  def spins
    @title = "Spins"
    @user  = User.find(params[:id])
    @opinions = @user.spins.paginate(page: params[:page])
    render 'show_follow'
  end
  #End Like Opinions Code
  
  #Like Comments Code
  def loves
    @title = "Loves"
    @user  = User.find(params[:id])
    @comments = @user.loves.paginate(page: params[:page])
    render 'show_follow'
  end
  #End Like Comments Code

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @categories = [['Game', 'Game'], ['Photo', 'Photo'], ['Family', 'Family'], ['Music', 'Music'], ['Shopping', 'Shopping'], ['Social', 'Social'], ['Communication', 'Communication']]
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in @user
        remember @user
        format.html { redirect_to home_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to home_url, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def login_admin
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
    end
  end

  def logged_in_user
    unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
    end
  end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :categories => [])
    end
    
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

