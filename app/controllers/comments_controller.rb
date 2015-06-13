class CommentsController < ApplicationController

    def new
    end

    def show
    	@link = Link.find(params[:id])
    	render :show
    end

end