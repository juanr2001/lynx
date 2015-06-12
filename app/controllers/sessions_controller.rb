class SessionsController < ApplicationController

	def login
		@action = login_path
		render :login
	end

	def create
    @user = User.find_by(email: params[:email])
    passhash = Digest::SHA1.hexdigest(params[:password])

    if @user && @user.password == passhash
      session[:user_id] = @user.id
    else
      @error = "No user found!"
    end

    redirect_to :root
  end

	def destroy
    session.delete(:user_id)
    @user = nil
    redirect_to :root
	end

end