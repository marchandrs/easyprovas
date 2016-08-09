class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email, :string
    add_column :users, :gender, :string
    add_column :users, :picture, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
