class TasksController < ApplicationController
  def index
    @welcome_msg = "Let's get down to business"
    @tasks = Task.all
  end

  def new
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
  end

  def edit
  end

  def update
  end
end
