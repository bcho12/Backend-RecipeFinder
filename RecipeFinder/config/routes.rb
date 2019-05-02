Rails.application.routes.draw do
  resources :favorites
  resources :recipes
  resources :users
		# post 'login', to: 'auth#create'
		get "fetch", to: "recipes#fetch"
		post '/login', to: 'auth#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
