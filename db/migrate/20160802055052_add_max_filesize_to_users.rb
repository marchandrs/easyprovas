class AddMaxFilesizeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :max_file_size, :integer
  end
end
