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
      redirect_to :root
    else
      flash[:notice] = "Sorry, no such user found!"
      redirect_to login_path 
    end

  end

	def destroy
    session.delete(:user_id)
    flash[:notice] = "Successfully logged out."
    @user = nil
    redirect_to :root
	end

end