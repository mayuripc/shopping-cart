Rails.application.routes.draw do

  devise_for :users
  
  devise_for :admins
 
  root to: 'products#index'
  
  resources :products, only: [:index, :show] do
    get 'products/:product_id',to:'products#index'
  end
  resources :categories, only: [:show]
  resource :cart,only: [:show] do
    
    get '/sign_out',to: 'sessions#destroy',as: :destroy_user_session_path
    get 'add/:product_id', to: 'carts#add', as: :add_to
    get 'remove/:product_id', to: 'carts#remove', as: :remove_from
    get 'remove_one/:product_id', to: 'carts#removeone', as: :remove_one_from
  end
 
  resources :transactions, only: [:new, :create]

  namespace :admin do
    root to: 'products#index'
    resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :orders, only: [:index]
  end

end
