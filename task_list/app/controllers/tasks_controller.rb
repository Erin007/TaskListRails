class TasksController < ApplicationController
  def index
    get_current_user
    if @user != nil
      @tasks = @user.tasks
    end
  end

  def new
    @task = Task.new
  end

  def show
    get_current_user
    @tasks = Task.where(user_id: @user.id)
    @task_of_interest = nil

    @tasks.each do |task|
      number = params[:id].to_i
      if task[:id] == number
        @task_of_interest = task
      end
    end

    if @task_of_interest == nil
      @task_of_interest = { id: params[:id].to_i, title: "That task was not found", description: "", completed: "", completed_at: ""}
    end
  end

  def destroy
    task.destroy
    redirect_to :index
  end

 def task
    @task ||= Task.find(params[:id].to_i)
  end

  def edit
    task
  end

  def update
    task.update_attributes(task_params)
    redirect_to index_path
  end

  def complete
    task.update_attributes(task_params)
    redirect_to :back #redirects to whatever page you came from with the updated c
  end

  def create
    get_current_user
    @task = Task.new(title: params[:task][:title], description: params[:task][:description], user_id: @user.id)
    @task.save

    if @task.save
        redirect_to tasks_path, alert: "Task successfully added."
    else
        redirect_to new_task_path, alert: "Error adding task."
    end
  end

  private
   def task_params
     #Tells Rails which parameters can be changed
     params.require(:task).permit(:title, :description, :completed, :user_id)
   end

   def get_current_user
     @user = User.find_by(id: session[:user_id]) # It will figure out the integer thing and return nil if it doesn't find anything
   end
end
