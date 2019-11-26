Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/new'
  get 'jokes/index'
  get 'jokes/show'
  get 'jokes/new'
  devise_for :users
  root to: 'pages#home'
  resources :jokes do
    resources :comments, only: [:create, :edit, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :favourites, only: [:show, :edit, :update]
  end
  resources :comments, only: [:show, :edit, :update, :destroy]
  resources :favourites, only: [:destroy, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
