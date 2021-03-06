class TaskTypeAttribute < ActiveRecord::Base
  belongs_to :task_type
  attr_accessible :default, :name, :description, :required, :task_type_id
end
