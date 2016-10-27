class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
  after_initialize :set_default_values
	enum user_type: [:regular, :inactive, :moderator, :admin, :anonymous]

	def set_default_values
		#self.active = true if self.active.nil?
		self.max_file_size = 2 if self.max_file_size.nil?
		self.user_type = :regular if self.user_type.nil?
	end

	def self.from_omniauth(auth)
  	#where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  	where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
  	  user.provider = auth.provider
  	  user.uid = auth.uid
  	  user.name = auth.info.name
			user.first_name = auth.info.first_name
			user.last_name = auth.info.last_name
			user.email = auth.info.email
			user.picture = auth.info.image
			user.gender = auth.extra.raw_info.gender
  	  user.oauth_token = auth.credentials.token
  	  user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  	  user.save!
  	end
  end

	def self.getAnonymousUser
		user = User.new
		user.id = nil
		user.name = 'Anônimo'
		user.user_type = :anonymous
		user
	end
end
