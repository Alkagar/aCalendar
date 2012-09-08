class AddRequiredToTaskTypeAttributes < ActiveRecord::Migration
  def change
    add_column :task_type_attributes, :required, :text
  end
end
