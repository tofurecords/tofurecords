Rails.application.routes.draw do

  get 'ship/new'
  get 'ship/index'
  get 'ship/edit'
  devise_for :users

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
        resources :favorites,only: [:create,:destroy]
    end
    resources :carts do
       resources :cartitems
    end
    post '/cartitems' => 'cartitems#create' , as: 'cartitem_create'
    resources :boughts
    resources :boughtitems
    resources :users,only: [:show,:edit,:update,:destroy] do
        get '/favorites' =>'users#favorites'
        resources :requests,only:[:create,:new]
    end

    resources :ships

    get '/cd_search' =>'cds#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
