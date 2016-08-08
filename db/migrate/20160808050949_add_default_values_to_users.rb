class AddDefaultValuesToUsers < ActiveRecord::Migration
  def change
    change_column :users, :user_type, :integer, :default => 0
    change_column :users, :max_file_size, :integer, :default => 2
  end
end
