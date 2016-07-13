class AppsController < ApplicationController
  before_action :require_login
  before_action :set_app, only: [:show, :edit, :update, :destroy, :followers]

  # GET /apps
  # GET /apps.json
  def index
    #@apps = App.all
    name = params[:name]
    platform = params[:platform]
    category = params[:category]
    @apps = App.search(name, platform, category)
    #@apps = App.search(params[:search])
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
    @app = App.find(params[:id])
    @microposts = @app.microposts.paginate(page: params[:page])
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
  # GET /random
  def random
    @app = App.order("RANDOM()").first
    if @app.nil?
        redirect_to home_url, notice: 'there is not app'
    else
    respond_to do |format|
        format.html { redirect_to @app}
        format.json { render :show, status: :show, location: @app }
    end
    end
  end 
  
  # GET /musthave
  def musthave
    @apps = RatingCache.order('avg, qty').reverse.first(5)
    render 'musthave'
  end
  
  def chosenforyou
    @categories = current_user.categories.split(',')
    @first = @categories[0]
    @apps = App.where('category = ?', @first)
    @categories.each do |cat|
        #logger.debug "category: #{cat[2...6].inspect}"
        cat = cat[2...6]
        @apps += App.where('category LIKE ?', "%#{cat}%")
    end
    render 'chosenforyou'
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
            format.html { redirect_to @ris}
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
            format.html { redirect_to @ris }
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

  def modify_app
  	@app = App.find(params[:id])
  end


  # POST /apps
  # POST /apps.json
  def create
    @app = App.new(app_params)
    #added code for realizers list
	#@developers = Developer.where(:id => params[:realizers])
    #logger.debug "DEVELOPER: #{@developers.inspect} \n"
	#@app.developers << @developers 
    #logger.debug "DEVELOPERS: #{@app.developers.inspect} \n"
	#end code

    respond_to do |format|
      if @app.save
        @app.developers << current_dev 
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
    @dev = @app.developers.first.id
    @app.destroy
    respond_to do |format|
      format.html { redirect_to developer_path(@dev), notice: 'App was successfully destroyed.' }
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
      params.require(:app).permit(:name, :platform, :category, :version, :picture)
    end
end
