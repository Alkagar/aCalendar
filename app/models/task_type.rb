class TaskType < ActiveRecord::Base
  attr_accessible :description, :name, :required
  has_many :task_type_attributes
end
