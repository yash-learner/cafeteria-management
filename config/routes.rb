Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/", to: "home#index"
  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_sessions
  get "/menu_categories/new", to: "menu_categories#new", as: :new_menu_categories

  resources :menu_categories
  resources :menu_items
  resources :users
  resources :orders
  resources :order_items

  # post "/menu_categories/UpdateActiveMenu" => "menu_categories#updateActiveMenu"
end
