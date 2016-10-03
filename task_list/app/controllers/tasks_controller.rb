class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @tasks = Task.all
    @task_of_interest = nil

    @tasks.each do |task|
      number = params[:id].to_i #params gives you the url, params returns a string that we need to turn into an integer so we can use it
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
    redirect_to request.referrer #redirects to whatever page you came from with the updated c
  end

  def create
    @task = Task.new(title: params[:title], description: params[:description])
    @task.save

    if @task.save
        redirect_to index_path, alert: "Task successfully added."
    else
        redirect_to new_path, alert: "Error adding task."
    end
  end

  private
   def task_params
     #Tells Rails which parameters can be changed
     params.require(:task).permit(:title, :description, :completed)
   end

end
