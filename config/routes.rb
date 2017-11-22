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

  root to: 'products#index', as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
