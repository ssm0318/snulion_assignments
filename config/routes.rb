Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks',
  }
  root 'feeds#index' #get '/' => 'feeds#index'와 동일
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
  get '/feeds/:id/like' => 'feeds#like'
  get '/events/:id/like' => 'events#like'
  get '/feeds/comments/:id/like' => 'feeds#comment_like'
  get '/events/comments/:id/like' => 'events#comment_like'
  get '/feeds/replies/:id/like' => 'feeds#reply_like'
  get '/feeds/:id/follow' => 'feeds#feed_follow'
  get '/events/:id/follow' => 'events#event_follow'
end
