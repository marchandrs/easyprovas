class RemoveVisibleFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :visible
  end
end
