Rails.application.routes.draw do


root to: 'users#index'

#User
get 'users/new', to: 'users#new'  # show me the new user signup form
post 'users', to: 'users#create' # the form action for signup

#Session
get 'login', to: 'sessions#login' # show the login page
post 'login', to: 'sessions#create' #set the user id in the session if password checks out
delete 'login', to: 'sessions#destroy' # remove user id

#Links
get 'links/new', to: 'links#create' # show the form for a new link
post 'links', to: 'links#new' # the form action for new link (if logged in)
get 'links/:id', to: 'links#show' # clicking a link takes it to destination
delete 'link/:id', to: 'links#delete' # delete a link that I own

#Comments
get 'links/:id/comments', to: 'comments#show' # gets the page for a link and its comments
post 'link/:id/comments', to: 'comments#new' # form action for new comment, creates a comment if logged in

end
