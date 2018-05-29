class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable, :omniauthable


	def self.from_omniauth(auth, signed_in_resource=nil) 
		user = User.where(:provider => auth.try(:provider) || auth["provider"], :uid => auth.try(:uid) || auth["uid"]).first
		if user
			return user
		else
			registered_user = User.where(:provider=> auth.try(:provider) || auth["provider"], :uid=> auth.try(:uid) || auth["uid"]).first || User.where(:email=> auth.try(:info).try(:email) || auth["info"]["email"]).first
			if registered_user
				unless registered_user.provider == (auth.try(:provider) || auth["provider"]) && registered_user.uid == (auth.try(:uid) || auth["provider"])
					registered_user.update_attributes(:provider=> auth.try(:provider) || auth["provider"], :uid=> auth.try(:uid) || auth["uid"])
				end
				return registered_user
			else
				user = User.new(:provider => auth.try(:provider) || auth["provider"], :uid => auth.try(:uid) || auth["uid"])
				user.email = auth.try(:info).try(:email) || auth["info"]["email"]
				if user.provider == "facebook"
					user.firstname = auth.try(:info).try(:first_name) || auth["info"]["name"].split(" ")[0]
					user.lastname = auth.try(:info).try(:last_name) || auth["info"]["name"].split(" ")[1]
				else
					user.firstname = auth.try(:info).try(:first_name) || auth["info"]["first_name"]
					user.lastname = auth.try(:info).try(:last_name) || auth["info"]["last_name"]
				end
				user.image = auth.try(:info).try(:image) || auth["info"]["image"]
				user.password = Devise.friendly_token[0,20]
 			# user.skip_confirmation!
 			user.save(validate: false)
 		end
 		user
 	end
 end


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

 def self.connect_to_linkedin(auth, signed_in_resource=nil) 
 	user = User.where(:provider => auth.try(:provider) || auth["provider"], :uid => auth.try(:uid) || auth["uid"]).first
 	if user
 		return user
 	else
 		registered_user = User.where(:provider=> auth.try(:provider) || auth["provider"], :uid=> auth.try(:uid) || auth["uid"]).first || User.where(:email=> auth.try(:info).try(:email) || auth["info"]["email"]).first
 		if registered_user
 			unless registered_user.provider == (auth.try(:provider) || auth["provider"]) && registered_user.uid == (auth.try(:uid) || auth["provider"])
 				registered_user.update_attributes(:provider=> auth.try(:provider) || auth["provider"], :uid=> auth.try(:uid) || auth["uid"])
 			end
 			return registered_user
 		else
 			user = User.new(:provider => auth.try(:provider) || auth["provider"], :uid => auth.try(:uid) || auth["uid"])
 			user.email = auth.try(:info).try(:email) || auth["info"]["email"]
 			if user.provider == "facebook"
 				user.firstname = auth.try(:info).try(:first_name) || auth["info"]["name"].split(" ")[0]
 				user.lastname = auth.try(:info).try(:last_name) || auth["info"]["name"].split(" ")[1]
 			else
 				user.firstname = auth.try(:info).try(:first_name) || auth["info"]["first_name"]
 				user.lastname = auth.try(:info).try(:last_name) || auth["info"]["last_name"]
 			end
 			user.image = auth.try(:info).try(:image) || auth["info"]["image"]
 			user.password = Devise.friendly_token[0,20]
 			# user.skip_confirmation!
 			user.save(validate: false)
 		end
 		user
 	end
 end

 # def self.from_omniauth(auth)
 # 	user = User.where(:provider => auth.try(:provider) || auth["provider"], :uid => auth.try(:uid) || auth["uid"]).first
 # 	if user
 # 		return user
 # 	else
 # 		registered_user = User.where(:provider=> auth.try(:provider) || auth["provider"], :uid=> auth.try(:uid) || auth["uid"]).first || User.where(:email=> auth.try(:info).try(:email) || auth["info"]["email"]).first
 # 		if registered_user
 # 			unless registered_user.provider == (auth.try(:provider) || auth["provider"]) && registered_user.uid == (auth.try(:uid) || auth["provider"])
 # 				registered_user.update_attributes(:provider=> auth.try(:provider) || auth["provider"], :uid=> auth.try(:uid) || auth["uid"])
 # 			end
 # 			return registered_user
 # 		else
 # 			user = User.new(:provider => auth.try(:provider) || auth["provider"], :uid => auth.try(:uid) || auth["uid"])
 # 			user.email = auth.try(:info).try(:email) || auth["info"]["email"]
 # 			if user.provider == "facebook"
 # 				user.firstname = auth.try(:info).try(:first_name) || auth["info"]["name"].split(" ")[0]
 # 				user.lastname = auth.try(:info).try(:last_name) || auth["info"]["name"].split(" ")[1]
 # 			else
 # 				user.firstname = auth.try(:info).try(:first_name) || auth["info"]["first_name"]
 # 				user.lastname = auth.try(:info).try(:last_name) || auth["info"]["last_name"]
 # 			end
 # 			user.image = auth.try(:info).try(:image) || auth["info"]["image"]
 # 			user.password = Devise.friendly_token[0,20]
 # 			user.skip_confirmation!
 # 			user.save(validate: false)
 # 		end
 # 		user
 # 	end
 # end
 
end
