require 'bcrypt'

class User

	include DataMapper::Resource

	property :id, Serial
	property :email, String, format: :email_address, unique: true, required: true
	property :password_digest, String, length:60

	attr_reader :password
	attr_accessor :password_confirmation

	validates_confirmation_of :password


	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(email, password)
  	first(email: email)
	end

end
