class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :categories, dependent: :destroy
	has_many :images, dependent: :destroy

	validates :user_name, presence: true, length: { maximum: 20 }
	validates :email,     presence: true, length: { maximum: 50 }

	# Password presence check is not necessary
	# It will be checked with "has_secure_password"
	validates :password, length: { minimum: 6 }, on: :create
	validates :password, length: { minimum: 6 }, if: "self.password.present?", on: :updating
	validates :password, presence: false, on: :password_reset
	validates :password, presence: true, length: { minimum: 6 }, on: :password_updating

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	# Make email lower cases before saving
	before_save { self.email = email.downcase }

	# Authentication
	has_secure_password

	# Make remember_token before saving
	before_create :create_remember_token

	# Extend class methods
	def User.new_token
		SecureRandom.urlsafe_base64
	end
	
	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def send_password_reset
		create_password_reset_token
		self.password_reset_sent_at = Time.zone.now
		save!(context: :password_reset)
		UserMailer.password_reset(self).deliver
	end

	private

		# Create token for staying signed in
		def create_remember_token
			self.remember_token = User.encrypt(User.new_token)
		end

		# Create token for password reset
		def create_password_reset_token
			self.password_reset_token = User.encrypt(User.new_token)
		end

end
