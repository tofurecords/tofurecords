Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root 'admin#roots#top'
    resources :users,only: [:index]
    resources :cds
    resources :artists
    resources :requests,only: [:index]
  end

  	root 'roots#top'
  	resources :cds,only: [:index,:show]
  	resources :artists,only: [:show]
  	resources :carts,only: [:index,:create]
  	resources :boughts,only: [:index]
  	resources :favorites,only: [:index]
  	resources :users,only: [:show,:edit,:update,:destroy]
    resources :ships,only: [:new,:create]
    resources :requests,only:[:create,:new]
  	post '/add_item' =>'carts#add_item'
  	post '/update_item' =>'carts#update_item'
  	delete '/delete_item' =>'carts#delete_item'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
