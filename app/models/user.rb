class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable, :omniauthable


	# ,
	# :omniauth_providers => [:facebook, :linkedin, :google_oauth2,
	# 	*(:developer if Rails.env.development?)]

	#  def self.from_omniauth(auth)
	#   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	#     user.email = auth.info.email
	#   end
	# end


	def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
		data = access_token.info
		user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
		if user
			return user
		else
			registered_user = User.where(:email => access_token.info.email).first
			if registered_user
				return registered_user
			else
				user = User.create(username: data["username"],
					provider:access_token.provider,
					email: data["email"],
					uid: access_token.uid ,
					password: Devise.friendly_token[0,20],
					)
			end
		end
	end
	
	def self.create_from_omniauth(params)
		user = find_or_create_by(email: params.info.email, uid: params.uid)
		user.update({
			token: params.credentials.token,
			name: params.info.username,
			avatar: params.info.image
			})
		user
	end
	def self.new_with_session(params, session)
		super.tap do |user|
			if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
				user.email = data["email"] if user.email.blank?
			end
		end
	end

	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.email = auth.info.email
			user.password = Devise.friendly_token[0,20]
			user.name = auth.info.name
			user.image = auth.info.image
		end
	end

	def self.connect_to_linkedin(auth, signed_in_resource=nil) 
		user = User.where(:provider => auth.provider, :uid => auth.uid).first
		if user
			return user 
		else
			registered_user = User.where(:email => auth.info.email).first
			if registered_user 
				return registered_user 
			else 
				user = User.create(name:auth.info.first_name, provider:auth.provider, uid:auth.uid, email:auth.info.email, password:Devise.friendly_token[0,20], 
					)

			end 
		end 
	end
end
