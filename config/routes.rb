Rails.application.routes.draw do
  root :to => "photos#index"
  # Routes for the Friendrequest resource:
  # CREATE
  get "/friendrequests/new", :controller => "friendrequests", :action => "new"
  post "/create_friendrequest", :controller => "friendrequests", :action => "create"

  # READ
  get "/friendrequests", :controller => "friendrequests", :action => "index"
  get "/friendrequests/:id", :controller => "friendrequests", :action => "show"

  # UPDATE
  get "/friendrequests/:id/edit", :controller => "friendrequests", :action => "edit"
  post "/update_friendrequest/:id", :controller => "friendrequests", :action => "update"

  # DELETE
  get "/delete_friendrequest/:id", :controller => "friendrequests", :action => "destroy"
  #------------------------------

  # Routes for the Like resource:
  # CREATE
  get "/likes/new", :controller => "likes", :action => "new"
  post "/create_like", :controller => "likes", :action => "create"

  # READ
  get "/likes", :controller => "likes", :action => "index"
  get "/likes/:id", :controller => "likes", :action => "show"

  # UPDATE
  get "/likes/:id/edit", :controller => "likes", :action => "edit"
  post "/update_like/:id", :controller => "likes", :action => "update"

  # DELETE
  get "/delete_like/:id", :controller => "likes", :action => "destroy"
  #------------------------------

  # Routes for the Photo resource:
  # CREATE
  get "/photos/new", :controller => "photos", :action => "new"
  post "/create_photo", :controller => "photos", :action => "create"

  # READ
  get "/photos", :controller => "photos", :action => "index"
  get "/photos/:id", :controller => "photos", :action => "show"

  # UPDATE
  get "/photos/:id/edit", :controller => "photos", :action => "edit"
  post "/update_photo/:id", :controller => "photos", :action => "update"

  # DELETE
  get "/delete_photo/:id", :controller => "photos", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
