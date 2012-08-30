class CreateTaskTypeAttributes < ActiveRecord::Migration
  def change
    create_table :task_type_attributes do |t|
      t.references :task_type
      t.string :name
      t.text :value
      t.text :default

      t.timestamps
    end
    add_index :task_type_attributes, :task_type_id
  end
end
