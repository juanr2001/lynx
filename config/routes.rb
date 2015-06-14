Rails.application.routes.draw do


root to: 'links#index'

#User
get 'users/new', to: 'users#new'  # show me the new user signup form
post 'users', to: 'users#create' # the form action for signup

#Session
get 'login', to: 'sessions#login' # show the login page
post 'login', to: 'sessions#create' #set the user id in the session if password checks out
delete 'login', to: 'sessions#destroy' # remove user id

#Links
get 'links/new', to: 'links#new' # show the form for a new link
get 'links/index', to: 'links#index' #shows all links
post 'links', to: 'links#create' # the form action for new link (if logged in)
get 'links/:id', to: 'links#show', as: 'links_show' # clicking a link takes it to destination
delete 'links/:id', to: 'links#delete' # delete a link that I own

#Comments
get 'links/:id/comments', to: 'comments#show', as: 'link_comments' # gets the page for a link and its comments
post 'links/:id/comments', to: 'comments#new' # form action for new comment, creates a comment if logged in

#votes
patch 'links/:id/up', to: 'votes#up', as: 'vote_up'
patch 'links/:id/down', to: 'votes#down', as: 'vote_down'

end
