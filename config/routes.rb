Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'products/index', to: 'products#index'
  get 'products/', to: 'products#index', as: 'index'
  get 'products/new', to: 'products#new_products', as: 'new'
  get 'products/updated', to: 'products#updated_products', as: 'recently_updated'
  get 'products/:id', to: 'products#product', as: 'product', number: /\d+/
  get 'contact', to: 'contacts#index', as: 'contact'
  get 'about', to: 'about_pages#index', as: 'about'
  get 'search_results', to: 'products#search_results', as: 'search_results'
  get 'products_by_category/:category', to: 'products#products_by_category', as: 'products_by_category', number: /\d+/
  get 'shopping_cart', to: 'shopping_carts#index', as: 'shopping_cart'
  post 'products/:id/add_to_cart', to: 'shopping_carts#add_to_cart', as: 'add_to_cart', number: /\d+/
  post 'shopping_cart/remove_from_cart/:id', to: 'shopping_carts#remove_from_cart', as: 'remove_from_cart', number: /\d+/
  post 'shopping_cart/increase_item_quantity/:id', to:'shopping_carts#increase_item_quantity', as: 'increase_item_quantity', number: /\d+/
  post 'shopping_cart/decrease_item_quantity/:id', to:'shopping_carts#decrease_item_quantity', as: 'decrease_item_quantity', number: /\d+/
  get 'shopping_cart/checkout', to: 'shopping_carts#checkout', as: 'checkout'
  get 'shopping_cart/update_address', to: 'shopping_carts#update_address', as: 'update_address'
  post 'shopping_cart/save_address', to: 'shopping_carts#save_address', as: 'save_address'

  root to: 'products#index', as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
