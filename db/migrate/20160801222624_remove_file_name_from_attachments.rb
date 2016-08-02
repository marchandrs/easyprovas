class RemoveFileNameFromAttachments < ActiveRecord::Migration
  def change
    remove_column :attachments, :filename, :string
  end
end
