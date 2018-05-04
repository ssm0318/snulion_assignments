Rails.application.routes.draw do
  devise_for :users
  get '/feeds' => 'feeds#index'
  get '/events' => 'events#index'
  get '/feeds/new' => 'feeds#new'
  get '/events/new' => 'events#new'
  post '/feeds' => 'feeds#create'
  post '/events' => 'events#create'
  delete '/feeds/:id' => 'feeds#destroy'
  delete '/events/:id' => 'events#destroy'
  get '/feeds/:id/edit' => 'feeds#edit'
  get '/events/:id/edit' => 'events#edit'
  post '/feeds/:id' => 'feeds#update'
  post '/events/:id' => 'events#update'
  post '/feeds/:id/comment_create' => 'feeds#comment_create'
  delete '/feeds/comments/:id' => 'feeds#comment_destroy'
  post '/events/:id/comment_create' => 'events#comment_create'
  delete '/events/comments/:id' => 'events#comment_destroy'
  post '/feeds/:id/reply_create' => 'feeds#reply_create'
  delete '/feeds/replies/:id' => 'feeds#reply_destroy'
  post '/events/:id/reply_create' => 'events#reply_create'
  delete '/events/replies/:id' => 'events#reply_destroy'
  post '/feeds/comments/:id/edit' => 'feeds#comment_edit'
  post '/feeds/:id/comment_update' => 'feeds#comment_update'
  post '/events/comments/:id/edit' => 'events#comment_edit'
  post '/events/:id/comment_update' => 'events#comment_update'
end
