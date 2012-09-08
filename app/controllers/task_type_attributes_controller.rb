class TaskTypeAttributesController < ApplicationController
    def index
        @task_type_attributes = TaskTypeAttribute.all
    end

    def new
        @task_type_attribute = TaskTypeAttribute.new
        @task_type_attribute.task_type_id = params[:task_type_id]
    end

    def create
        @task_type_attribute = TaskTypeAttribute.new params[:task_type_attribute]
        if @task_type_attribute.valid?
            flash[:notice] = t(:general_flash_status_ok)
            redirect_to(task_type_attributes_path) if @task_type_attribute.save
        end
    end 
end
