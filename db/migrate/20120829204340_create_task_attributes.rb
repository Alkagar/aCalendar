class CreateTaskAttributes < ActiveRecord::Migration
  def change
    create_table :task_attributes do |t|
      t.references :task
      t.references :task_type_attribute
      t.text :value

      t.timestamps
    end
    add_index :task_attributes, :task_id
    add_index :task_attributes, :task_type_attribute_id
  end
end
