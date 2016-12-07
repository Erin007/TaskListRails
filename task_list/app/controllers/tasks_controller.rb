class TasksController < ApplicationController
#Modify the Task Controller index and show actions so that a user only sees tasks that belong to them. I do this by first getting the current user, then asking @user.tasks which gives only the tasks belonging to that particular user.
  def index
    get_current_user
    if @user != nil
      @tasks = @user.tasks
    end
  end

  def show
    get_current_user
    @tasks = @user.tasks
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

#Modify the Task Controller's edit and update method to ensure that the user cannot edit a task that does not belong to them.
  def edit
    get_current_user
    if @user.tasks.include?(task) #If the task they want to edit belongs to them
      task
    else #If the task they want to edit does NOT belong to them
      flash.alert = "You can only edit your own tasks."
      redirect_to root_path
    end
  end

  def update
    get_current_user
    if @user.tasks.include?(task)
      task.update_attributes(task_params)
      redirect_to index_path
    else
      flash.alert = "You can only edit your own tasks."
    end
  end

#Modify the new and create actions for the task controller so that the new task created will belong to the current user. In the create method I get the current user and set the user id for the task being created to the id of that user
  def new
    @task = Task.new
  end

  def create
    get_current_user
#Ensure that unauthenticated users cannot create tasks and are redirected to login.
    if @user != nil
      @task = Task.new(title: params[:task][:title], description: params[:task][:description], user_id: @user.id)
      @task.save

      if @task.save
          redirect_to tasks_path, alert: "Task successfully added."
      else
          redirect_to new_task_path, alert: "Error adding task."
      end
    else #The user isn't logged in
      flash.alert = "You must log in to add tasks to a list."
    end
  end

  def complete
    task.update_attributes(task_params)
    redirect_to :back 
  end

private

   def task
     @task ||= Task.find(params[:id].to_i)
   end

   def task_params
     #Tells Rails which parameters can be changed
     params.require(:task).permit(:title, :description, :completed, :user_id)
   end

   def get_current_user
     @user = User.find_by(id: session[:user_id]) # It will figure out the integer thing and return nil if it doesn't find anything
   end
end
