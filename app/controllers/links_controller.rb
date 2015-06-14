class LinksController < ApplicationController
	def index
		page = params[:page]
		unless page
			page = 1
		end
		@links = Link.order(posted_at: :desc).page(page).sort_by {|link| -link.total_votes }
		@user = User.find(session[:user_id]) if session[:user_id]
		render :index
	end

	def create
		time = Time.now
		user_id = session[:user_id]
		if user_id

			url = params[:url]

			unless url =~ /^http:\/\//
				url = "http://" + url
			end

			@link = Link.create(user_id: user_id, destination: url,title: params[:title], posted_at: time)
		end

		redirect_to links_index_path
	end

	def new
		if session[:user_id]
			render :new
		else
			flash[:notice] = "Must be logged in to post a new link."
			redirect_to login_path
		end
	end

	def show
		@link= Link.find_by(id: params[:id])
		redirect_to @link.destination
	end


	def delete
		@link = Link.find_by(id: params[:id])
		@link.destroy!
		redirect_to links_index_path
	end

end