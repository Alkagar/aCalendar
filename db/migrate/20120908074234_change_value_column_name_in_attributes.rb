class ChangeValueColumnNameInAttributes < ActiveRecord::Migration
    def change
        rename_column :task_type_attributes, :value, :description
    end
end
