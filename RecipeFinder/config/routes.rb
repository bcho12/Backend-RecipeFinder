Rails.application.routes.draw do
  resources :favorites
  resources :recipes
  resources :users
		# post 'login', to: 'auth#create'
		get "fetch", to: "recipes#fetch"
		post '/login', to: 'auth#login', as: :login
    get '/profile', to: 'users#profile', as: :profile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
