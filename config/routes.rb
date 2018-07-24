Rails.application.routes.draw do

  get 'ship/new'
  get 'ship/index'
  get 'ship/edit'
devise_for :users
# root 'user#show'

  namespace :admin do
    get "/"=>"root#top"

    resources :users,only: [:index]
    resources :cds
    resources :artists
    resources :requests,only: [:index]
  end


    root 'roots#top'
    resources :cds
    resources :artists,only: [:index, :show] do
        resources :favorites,only: [:index, :create,:destroy]
        # delete '/artist' => 'favorites#destroy'
    end
    resources :carts do
       resources :cartitems
    end
    post '/cartitems' => 'cartitems#create' , as: 'cartitem_create'
    resources :boughts
    resources :boughtitems
    resources :users,only: [:show,:edit,:update,:destroy] do
        
    end

    resources :ships
    resources :requests,only:[:create,:new]

    get '/cd_search' =>'cds#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
