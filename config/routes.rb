Rails.application.routes.draw do

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
    resources :artists,only: [:show]
    resources :carts
    resources :cartitems
    resources :boughts
    resources :boughtitems
    resources :users,only: [:show,:edit,:update,:destroy] do
        resources :favorites,only: [:index]
    end

    resources :ships
    resources :requests,only:[:create,:new]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
