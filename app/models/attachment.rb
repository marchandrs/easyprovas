class Attachment < ActiveRecord::Base
  belongs_to :post
  mount_uploader :data, AttachmentUploader
  before_save :update_attributes

  private

  def update_attributes
    if data.present? && data_changed?
      self.content_type = data.file.content_type
      self.file_size = data.file.size
    end
  end
end
