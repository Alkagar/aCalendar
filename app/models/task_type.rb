class TaskType < ActiveRecord::Base
  attr_accessible :description, :name, :required
end
