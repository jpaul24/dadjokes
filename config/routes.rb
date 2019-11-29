Rails.application.routes.draw do
  devise_for :users
  root to: 'jokes#index'
  resources :jokes do
    resources :comments, only: [:create]
    resources :favourites, only: [:new, :create]
  end
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :favourites, only: [:show, :edit, :update]
  end
  resources :comments, only: [:edit, :update, :destroy]
  resources :favourites, only: [:destroy, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
