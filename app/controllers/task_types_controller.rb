class TaskTypesController < ApplicationController
    def index
        @task_types = TaskType.all
    end

    def new
        @task_type = TaskType.new
    end

    def create
        @task_type = TaskType.new params[:task_type]
        if @task_type.valid?
            flash[:notice] = t(:general_flash_status_ok)
            redirect_to(task_types_path) if @task_type.save
        end
    end 
end
