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
            if @task.save
                flash[:notice] = t(:general_flash_status_ok)
                logger.warn params
                Array(params[:attributes]).each do |name, value|
                    taskAttribute = TaskAttribute.new
                    taskAttribute.value = value
                    taskAttribute.task_id = @task.id
                    taskAttribute.task_type_attribute_id = name.split('_').last
                    unless taskAttribute.save
                        logger.info 'nie udalo sie'
                    end
                end
                redirect_to(tasks_path)
            end
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
