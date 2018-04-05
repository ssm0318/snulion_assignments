Rails.application.routes.draw do
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
end
