class LinksController < ApplicationController
	def index
		@links = Link.order(posted_at: :desc).page(params[:page])
		render :index
	end

	def create
		time = Time.now
		@link = Link.create(user_id: nil, destination: params[:url],title: params[:title], posted_at: time)
		render :create
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