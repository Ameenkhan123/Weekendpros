class AuthsController < ApplicationController
  layout 'weekendpro'
  def index
    @user =User.all
  end
  
end
