Rails.application.routes.draw do
  root to: 'homes#search'

  get "/homes", to: "homes#index", as: :homes
  namespace :admin do
    resources :homes, only: [:index]
    patch "/homes/:id/suspend", to: "homes#suspend", as: :suspend_home
    patch "/homes/:id/reactivate", to: "homes#reactivate", as: :reactivate_home
    resources :owners, only: [:index]
    resources :users, only: [:index]
  end

  namespace :user, path: ":path", as: :user do
    resources :homes
  end

  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create", as: :session_users
  delete "/logout", to: "sessions#destroy", as: :logout
  resources :orders, only: [:index, :create, :show]

  resources :users, param: :slug

  get "/:user/dashboard", to: "users#show", as: :dashboard
  get "/cart", to: "carts#show"
  post ":user/homes/:id", to: "carts#create"
  delete "/cart", to: "carts#destroy"

  get "/search", to: "homes#search", as: :search
end
