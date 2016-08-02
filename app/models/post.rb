class Post < ActiveRecord::Base
  #belongs_to :user
  #has_many :comments
  has_many :attachments
  accepts_nested_attributes_for :attachments
  after_initialize :set_default_values

  def short_text
    self.text[0..150]
  end

  def set_default_values
    self.visible = true if self.visible.nil?
  end
end
