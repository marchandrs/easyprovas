class User < ActiveRecord::Base
	has_many :posts
	has many :comments
  after_initialize :set_default_values

	def set_default_values
		self.active = true if self.active.nil?
	end
end
