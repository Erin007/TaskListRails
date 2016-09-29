class TasksController < ApplicationController
  def index
    @welcome_msg = "Let's get down to business"
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
    Task.find(params[:id].to_i).destroy
    redirect_to :index
  end

  def edit
  end

  def update
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
     #Tells Rails you can accept submits from the form
     params.require(:task).permit(:title, :description)
   end

end
