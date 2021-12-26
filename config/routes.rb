Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  root to: "items#index"
  resources :items do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
  post 'want/:id' => 'wants#create', as: 'create_want'
  delete 'want/:id' => 'wants#destroy', as: 'destroy_want'
end
