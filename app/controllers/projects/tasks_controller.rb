class Projects::TasksController < ApplicationController # because task is nested inside of project Project:: ahead of Taskcontroller was needed
  before_action :set_task, only: [:show, :update, :edit, :destory]
  before_action :set_project, only: [:show, :new, :edit, :create, :update, :destory]
  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.project_id = @project.id
    respond_to do |format| #it defines how the action should respond to different kind of requests
      if @task.save
      format.html { redirect_to project_url(@task.project_id), notice:'Task was created successfully'  } #This line redirects the user to the newly created task's show page if the task was successfully saved, and displays a flash notice indicating success.
      format.json {render :show, status: :created, location: @task} #This line returns a JSON representation of the newly created task with a 201 (created) status code.
      else
        format.html{render :new} #This line renders the new template for the Task model, which will display any validation errors for the user to correct.
        format.json{render json: @task.errors, status: :unprocessable_entity} #This line returns a JSON representation of the errors encountered when trying to save the new task with a 422 (unprocessable entity) status code.
    
      end
    end
  end


  def update
    respond_to do |format| #it defines how the action should respond to different kind of requests
      if @task.update(task_params)
      format.html { redirect_to project_url(@task.project_id), notice:'Task was updated successfully'  } #This line redirects the user to the newly created task's show page if the task was successfully saved, and displays a flash notice indicating success.
      format.json {render :show, status: :created, location: @task} #This line returns a JSON representation of the newly created task with a 201 (created) status code.
      else
        format.html{render :edit} 
        format.json{render json: @task.errors, status: :unprocessable_entity} #This line returns a JSON representation of the errors encountered when trying to save the new task with a 422 (unprocessable entity) status code.
      end
    end
  end

  def destory
    respond_to do |format|
      format.html { redirect_to project_url(@task.project_id), notice:"Task was deleted successfully" } #This line is redirecting the user to the show page of the project that the task belong to after it is deleted.
      format.json { head :no_content}
    end
  end


  

  private #I am marking both the below methods as private as i dont want it to be used by any other class
   def set_task
    @task = Task.find(params[:id]) #IT is looking in the browser and finding the id from the url

   end

   def set_project
    @project = Project.find(params[:project_id]) #it will look into the url which will be like projects/5/tasks/2, it will get the 5 from the url, go in the databse and find that specific project_id
   end


   def task_params
    params.require(:task).permit(:title, :description, :project_id, :completed, :task_file)
  end
end


