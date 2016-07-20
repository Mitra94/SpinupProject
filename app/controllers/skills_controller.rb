class SkillsController < ApplicationController
  
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  # GET /skills
  # GET /skills.json
  def index
    @skills = Skill.all
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
	@skills = Skill.find(params[:id])
  end

  def show_htmlcss
  	@skills = Skill.find(params[:id])
  end

  def show_java
	@skills = Skill.find(params[:id])
  end

  def show_javascript
	@skills = Skill.find(params[:id])
  end

  def show_c
	@skills = Skill.find(params[:id])
  end

  def show_c_plus_plus
	@skills = Skill.find(params[:id])
  end

  def show_nodejs
	@skills = Skill.find(params[:id])
  end

  def show_database
	@skills = Skill.find(params[:id])
  end

  def show_algorithms
	@skills = Skill.find(params[:id])
  end
  
  def show_android
	@skills = Skill.find(params[:id])
  end

  def show_ios
	@skills = Skill.find(params[:id])
  end

  # GET /skills/new
  def new
    @skill = Skill.new
  end

  # GET /skills/1/edit
  def edit
	@skills = Skill.find(params[:id])
  end

  def edit_htmlcss
	@skill = Skill.find(params[:id])
	@approval = Approval.create(skill: 'htmlcss', voted: params[:id], voter: current_dev.id)
  end

  def edit_java
	@skill = Skill.find(params[:id])
	@approval = Approval.create(skill: 'java', voted: params[:id], voter: current_dev.id)
  end

  def edit_javascript
	@skill = Skill.find(params[:id])
	@approval = Approval.create(skill: 'javascript', voted: params[:id], voter: current_dev.id)
  end

  def edit_c
	@skill = Skill.find(params[:id])
	@approval = Approval.create(skill: 'c', voted: params[:id], voter: current_dev.id)
  end

  def edit_cplus
	@skill = Skill.find(params[:id])
	@approval = Approval.create(skill: 'cplus', voted: params[:id], voter: current_dev.id)
  end

  def edit_nodejs
	@skill = Skill.find(params[:id])
	@approval = Approval.create(skill: 'nodejs', voted: params[:id], voter: current_dev.id)
  end

  def edit_database
	@skill = Skill.find(params[:id])
	@approval = Approval.create(skill: 'database', voted: params[:id], voter: current_dev.id)
  end

  def edit_algorithms
	@skill = Skill.find(params[:id])
	@approval = Approval.create(skill: 'algorithms', voted: params[:id], voter: current_dev.id)
  end

  def edit_android
	@skill = Skill.find(params[:id])
	@approval = Approval.create(skill: 'android', voted: params[:id], voter: current_dev.id)
  end

  def edit_ios
	@skill = Skill.find(params[:id])
	@approval = Approval.create(skill: 'ios', voted: params[:id], voter: current_dev.id)
  end



  def search
  end

  def results
	@range = 1..Skill.count
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(skill_params)

    respond_to do |format|
      if @skill.save
        format.html { redirect_to @skill, notice: 'Skill was successfully created.' }
        format.json { render :show, status: :created, location: @skill }
      else
        format.html { render :new }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to @skill, notice: 'Skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_url, notice: 'Skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skill).permit(:html_css, :java, :javascript, :c, :c_plus_plus, :nodejs, :database, :algorithms, :android, :ios)
    end
end
