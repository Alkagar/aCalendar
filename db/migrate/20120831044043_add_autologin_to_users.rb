class AddAutologinToUsers < ActiveRecord::Migration
  def change
      add_column :users, :autologin, :boolean
  end
end
