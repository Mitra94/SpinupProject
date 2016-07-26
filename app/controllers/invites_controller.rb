class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]

  # GET /invites
  # GET /invites.json
  def index
    @invites = Invite.all
  end

  # GET /invites/1
  # GET /invites/1.json
  def show
  end

  # GET /invites/new
  def new
    @invite = Invite.new
  end

  # GET /invites/1/edit
  def edit
  end

  def requests
  end

  def pending_invites
  end

  def accept
    @app = App.find(params[:id])
    @invite = Invite.find_by(app: @app.name, receiver: current_dev.id)
    @dev = Developer.find(@invite.sender)
    @app.developers << @dev
    respond_to do |format|
      if @invite.destroy
        format.html { redirect_to @app, success: 'A new developer joined your team!' }
        format.json { render :show, status: :destroyed, location: @app }
      else
        format.html { render :back }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end


  def accept_invite
    @app = App.find(params[:id])
    @invite = Invite.find_by(app: @app.name, receiver: current_dev.id)
    @app.developers << current_dev
    respond_to do |format|
      if @invite.destroy
        format.html { redirect_to @app, success: 'You joined the development team!' }
        format.json { render :show, status: :destroyed, location: @app }
      else
        format.html { render :new }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end    
  end

  def refuse
    @app = App.find(params[:id])
    @invite = Invite.find_by(app: @app.name, receiver: current_dev.id)
    respond_to do |format|
      if @invite.destroy
        format.html { redirect_to @app, danger: 'Invite deleted...' }
        format.json { render :show, status: :destroyed, location: @app }
      else
        format.html { render :new }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  def refuse_invite
    @app = App.find(params[:id])
    @invite = Invite.find_by(app: @app.name, receiver: current_dev.id)
    respond_to do |format|
      if @invite.destroy
        format.html { redirect_to @app, danger: 'Invite deleted...' }
        format.json { render :show, status: :destroyed, location: @app }
      else
        format.html { render :new }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end



  # POST /invites
  # POST /invites.json
  def create
    @invite = Invite.new(:app => params[:app], :sender => params[:sender], :receiver => params[:receiver])

    respond_to do |format|
      if @invite.save
        format.html { redirect_to developer_path(current_dev), success: 'Invite was successfully sent to the developer!' }
        format.json { render :show, status: :created, location: @invite }
      else
        format.html { render :new }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_invite
      @app = App.find(params[:id])
      @invite = Invite.new(app: @app.name, sender: current_dev.id, receiver: @app.developers.first.id)
      respond_to do |format|
        if @invite.save
        format.html { redirect_to @app, success: 'Invite was successfully sent to the creator of the app' }
        format.json { render :show, status: :created, location: @app }
        else
        format.html { render :new }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invites/1
  # PATCH/PUT /invites/1.json
  def update
    respond_to do |format|
      if @invite.update(invite_params)
        format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
        format.json { render :show, status: :ok, location: @invite }
      else
        format.html { render :edit }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json
  def destroy
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to invites_url, notice: 'Invite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invite_params
      params.require(:invite).permit(:app, :sender, :receiver)
    end
end
