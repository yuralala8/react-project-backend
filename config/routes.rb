Rails.application.routes.draw do
	namespace :api do
    	namespace :v1 do
			resources :users
			post '/login', to: 'auth#create'
			post '/suggestions', to: 'suggestions#create'
			post '/suggestions/:id', to: 'suggestions#update'
			delete '/suggestions/:id', to: 'suggestions#destroy'
			get '/me', to: 'users#me'
     		get '/suggestions', to: 'suggestions#index'
			get '/restaurants/:search/:location', to: 'restaurants#index'
			get '/restaurants/:id', to: 'restaurants#show'
			# post '/suggestions', to: 'suggestions#create'
			# get '/me', to: 'users#me'
    	end
    end
end
