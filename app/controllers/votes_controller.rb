class VotesController < ApplicationController
	def up
		if session[:user_id]
			link_id = params[:id]
			user_id = session[:user_id]
			@vote = Vote.find_or_create_by(user_id: user_id, link_id: link_id)
			@vote.update(score: 1)
			redirect_to :root
		else
			flash[:notice] = "You must be logged in to vote!"
			redirect_to :root
		end
	end

	def down
		if session[:user_id]
			link_id = params[:id]
			user_id = session[:user_id]
			@vote = Vote.find_or_create_by(user_id: user_id, link_id: link_id)
			@vote.update(score: -1)
			redirect_to :root
		else 
			flash[:notice] = "You must be logged in to vote!"
			redirect_to :root
		end
	end
end