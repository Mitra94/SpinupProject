class AppsController < ApplicationController
  before_action :require_login
  before_action :set_app, only: [:show, :edit, :update, :destroy, :followers]

  # GET /apps
  # GET /apps.json
  def index
    #@apps = App.all
    @apps = App.search(params[:search])
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
    @app = App.find(params[:id])
    @microposts = @app.microposts.paginate(page: params[:page])
  end

  def choose_your_apps
  end

  # GET /apps/new
  def new
    @app = App.new
  end
  
  def followers
    @title = "Followers"
    @app  = App.find(params[:id])
    @users = @app.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  # GET /random
  def random
    @app = App.order("RANDOM()").first
    respond_to do |format|
        format.html { redirect_to @app, notice: 'Spin randomly succeded' }
        format.json { render :show, status: :show, location: @app }
    end
  end 
  
  # GET /musthave
  def musthave
    @apps = RatingCache.order('avg').reverse.first(5)
    render 'musthave'
  end
  
  
  def appoftheday
    @apps = App.all.where("created_at >= ?", Time.zone.now.beginning_of_day)
    if @apps.empty?
        respond_to do |format|
        format.html { redirect_to home_url, notice: 'No app has been created today!' }
        format.json { head :no_content }
        end
    elsif @apps.count == 1
        @ris = @apps.first()
        respond_to do |format|
            format.html { redirect_to @ris, notice: 'App of the day' }
            format.json { render :show, status: :show, location: @app }
        end
    else
        @ris = @apps.first()
        @sum = @ris.rates("vote").sum("stars")
        @apps.each do |app|
            @temp = app.rates("vote").sum("stars")
            if @temp > @sum
                @sum = @temp
                @ris = app
            end
        end
        respond_to do |format|
            format.html { redirect_to @ris, notice: 'App of the day' }
            format.json { render :show, status: :show, location: @app }
        end
    end
  end
  
  # GET /freshapps
  def fresh
    @apps = App.order("created_at").last(5).reverse
  end
  
  # GET /apps/1/edit
  def edit
  end
  

  # POST /apps
  # POST /apps.json
  def create
    @app = App.new(app_params)
    #added code for realizers list
	@developers = Developer.where(:id => params[:realizers])
	@app.developers << @developers 
	#end code

    respond_to do |format|
      if @app.save
        format.html { redirect_to @app, notice: 'App was successfully created.' }
        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apps/1
  # PATCH/PUT /apps/1.json
  def update
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url, notice: 'App was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:name, :platform, :category)
    end
end
