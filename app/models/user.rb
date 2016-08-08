class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
  after_initialize :set_default_values
	enum type: [:active, :inactive, :moderator, :admin]

	def set_default_values
		#self.active = true if self.active.nil?
	end
end
