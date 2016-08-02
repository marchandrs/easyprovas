class RenameFilesizeColumn < ActiveRecord::Migration
  def change
    rename_column :attachments, :filesize, :file_size
  end
end
