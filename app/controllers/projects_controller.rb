class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  #The method inside the before action is called before any of the below method is called.  
  #In here set_project method is called before calling the show ,edit, update and destroy method.
  #It


  # GET /projects or /projects.json
  def index
    @projects = Project.still_needs_some_works
  end

  # GET /projects/1 or /projects/1.json
  def show
    @tasks = @project.tasks  #Here the tasks is the task stored in the project variable
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # This project_params is called at different places in the code. This ensures that the passed data in the database can only be title, description and percen_complete.
    #Any other parameters are ignored and not saved in the database
    def project_params
      params.require(:project).permit(:title, :description, :percent_complete)
    end
end
