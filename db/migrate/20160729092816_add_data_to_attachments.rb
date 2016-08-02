class AddDataToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :data, :string
  end
end
