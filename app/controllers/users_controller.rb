class UsersController < ApplicationController
	
	def new
		@action = users_path
		render :new
	end

	def create
		passhash = Digest::SHA1.hexdigest(params[:password])
		@user = User.create(email: params[:email], password: passhash)
		redirect_to :root
	end

end