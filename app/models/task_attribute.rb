class TaskAttribute < ActiveRecord::Base
  belongs_to :task
  belongs_to :task_type_attribute
  attr_accessible :value
end
