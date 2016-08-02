class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :filename
      t.integer :filesize
      t.string :checksum

      t.timestamps null: false
    end
  end
end
