Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/", to: "home#index"
  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_sessions
  get "/menu_categories/new", to: "menu_categories#new", as: :new_menu_categories
  get "/menu_items/new", to: "menu_items#new", as: :new_menu_items
  get "/menu_items/editMenu", to: "menu_items#editMenu", as: :show_menu_items
  # post "/carts", to: "cart#create", as: :create_carts
  # put "/menu_items/i", to: "menu_items#update", as: :update_menu_items
  put "/cart_items/:id/decrement", to: "cart_items#decrement", as: :decrement_cart_items
  put "/cart_items/:id/increment", to: "cart_items#increment", as: :increment_cart_items
  post "/cart_items/:id/create" => "cart_items#create"
  get "/order_items/:id/order" => "order_items#order"
  get "/order_items" => "order_items#index"
  get "/admins" => "admins#index"

  post "/users/:id/removeAsClerk" => "users#removeAsClerk"
  post "/users/:id/makeAsClerk" => "users#makeAsClerk"
  post "/users/create_clerk" => "users#createClerk"
  get "/users/new_clerk" => "users#newClerk"

  get "/menu_categories/change_menu_category_status" => "menu_categories#allMenu"
  post "/menu_categories/:id/toggle_menu_status" => "menu_categories#toggleMenuStatus"
  get "/menu_items/:id/update_each" => "menu_items#updateEach"
  resources :menu_categories
  resources :menu_items
  resources :users
  resources :orders
  resources :order_items
  resources :carts
  resources :cart_items
  resources :admins

  # post "/menu_categories/UpdateActiveMenu" => "menu_categories#updateActiveMenu"
end
