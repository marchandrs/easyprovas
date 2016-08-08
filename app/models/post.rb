class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :attachments
  accepts_nested_attributes_for :attachments
  after_initialize :set_default_values
  acts_as_taggable_on :tags
  enum status: [:active, :invisible, :blocked]

  def short_text(length = 150)
    self.text[0..length]
  end

  def set_default_values
    #self.visible = true if self.visible.nil?
  end
end
