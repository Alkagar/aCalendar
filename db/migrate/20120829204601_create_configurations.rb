class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.string :name
      t.string :value
      t.text :description

      t.timestamps
    end
  end
end
