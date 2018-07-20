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
    resources :artists,only: [:index, :show]
    resources :carts do
       resources :cartitems
   end
    post '/cartitems' => 'cartitems#create' , as: 'cartitem_create'
    resources :boughts
    resources :boughtitems
    resources :favorites,only: [:index]
    resources :users,only: [:show,:edit,:update,:destroy]

    resources :ships
    resources :requests,only:[:create,:new]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
