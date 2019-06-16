Rails.application.routes.draw do

  resources :orders
  resources :products
  resources :brands
  resources :shops
  	# sessions
	get 'login' => 'sessions#new', as: 'login'
	post 'sessions/create' => 'sessions#create', as: 'create_session'
	get 'logout' => 'sessions#destroy', as: 'logout'

	# Users
  	resources :users

  	# API Stuff
	namespace :api, :defaults => {:format => :json} do

		# Users
		post 'login' => 'users#login'
		resources :users

		# Orders
		resources :orders

		# Products
		get 'products/ean/:ean' => 'products#getProductFromEAN'
		resources :products

	end
end
