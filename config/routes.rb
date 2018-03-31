Rails.application.routes.draw do
  get '/feeds' => 'feeds#index'
  get '/feeds/new' => 'feeds#new'
  post '/feeds' => 'feeds#create'
  delete '/feeds/:id' => 'feeds#destroy'
end
