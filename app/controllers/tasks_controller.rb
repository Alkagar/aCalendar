class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
        @task_types = TaskType.all
    end

    def create
        @task = Task.new params[:task]
        @task_types = TaskType.all
        if @task.valid?
            @task.user_id = @logged_user.id
            @task.duration = @task.compute_duration
            flash[:notice] = t(:general_flash_status_ok)
            redirect_to(tasks_path) if @task.save
        end
    end 

    def attributes
        task_type_id = params[:task_type_id]
        task_type = TaskType.where(:id => task_type_id).first
        unless task_type.nil?
            @task_type_attributes = task_type.task_type_attributes
            render 'attributes', :layout => nil
        end
    end
end
