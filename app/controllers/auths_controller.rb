class AuthsController < ApplicationController
	layout 'weekendpro'
	def index
		@user =User.all
	end
	
	def show
	end

	def profile
	end
end
