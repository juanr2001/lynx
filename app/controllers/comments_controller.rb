class CommentsController < ApplicationController

    def new
    	user_id = session[:user_id]
    	if user_id
	    	content = params[:content]
	    	link_id = params[:id]

	    	Comment.create(user_id: user_id, link_id: link_id, content: content)
	    	redirect_to link_comments_path
	    else 
	    	flash[:notice] = "You have to be logged in to comment"
	    	redirect_to link_comments_path
	    end
    end

    def show
    	@link = Link.find(params[:id])
    	render :show
    end

end