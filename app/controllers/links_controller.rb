class LinksController < ApplicationController
	def index
		@links = Link.order(posted_at: :desc).page(params[:page])
		render :index
	end

	def create
		time = Time.now
		if session[:user_id]

			url = params[:url]

			unless url =~ /^http:\/\//
				url = "http://" + url
			end

			@link = Link.create(user_id: session[:user_id], destination: url,title: params[:title], posted_at: time)
		end

		redirect_to links_index_path
	end

	def new
		render :new
	end

	def show
		@links= Link.find_by(id: params[:id])
	end


	def delete
		@link = Link.find_by(id: params[:id])
		@link.destroy!
		redirect_to :root
	end

end