class UsersController < ApplicationController

	def new
		@action = users_path
		@message = "Register"
		render :new
	end

	def create
		passhash = Digest::SHA1.hexdigest(params[:password])
		@user = User.create(email: params[:email], password: passhash)
		session[:user_id] = @user.id
		redirect_to :root
	end

end