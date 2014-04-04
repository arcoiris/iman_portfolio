class User < ActiveRecord::Base
	before_save {self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
										uniqueness: true, 
										format: { with: VALID_EMAIL_REGEX } 

	has_secure_password 
	validates :password, length: { minimum: 6 }

	def send_password_reset
		generate_token(:password_reset_token)
		self.password_reset_sent_at = Time.zone.now
		save!
		UserMailer.password_reset(self).deliver
	end

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column: self[column])
	end
end

