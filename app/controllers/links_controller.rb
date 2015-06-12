class LinksController < ApplicationController
	def index
		@links = Link.order(posted_at: :desc).page(params[:page])
		render :index
	end

	def create
		@link = Link.create(title: params[:title])

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

		rederect_to :root
	end

end