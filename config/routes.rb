Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :comments, only: :create
  end
  resources :users, only: [:show]
  post 'like/:id' => 'likes#create', as: 'create_like'
end
