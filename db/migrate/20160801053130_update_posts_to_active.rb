class UpdatePostsToActive < ActiveRecord::Migration
  def change
    Post.update_all(visible: true)
  end
end
