class CreateTaskTypes < ActiveRecord::Migration
  def change
    create_table :task_types do |t|
      t.string :name
      t.text :description
      t.boolean :required

      t.timestamps
    end
  end
end
