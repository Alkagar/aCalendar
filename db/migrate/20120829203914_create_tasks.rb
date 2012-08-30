class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.references :user
      t.datetime :begin
      t.datetime :end
      t.references :task_type

      t.timestamps
    end
    add_index :tasks, :user_id
    add_index :tasks, :task_type_id
  end
end
