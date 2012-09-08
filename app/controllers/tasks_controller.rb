class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new params[:task]
        if @task.valid?
            @task.user_id = @logged_user.id
            @task.duration = @task.compute_duration
            flash[:notice] = t(:general_flash_status_ok)
            redirect_to(tasks_path) if @task.save
        end
    end 
end
