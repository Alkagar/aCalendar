class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :task_type
  attr_accessible :begin, :description, :duration, :end, :name
end
