Rails.application.routes.draw do
	namespace :api do
    	namespace :v1 do
			resources :users
			post '/login', to: 'auth#create'
			post '/suggestions', to: 'suggestions#create'
			get '/me', to: 'users#me'
     		get '/suggestions', to: 'suggestions#index'
			get '/restaurants/:search/:location', to: 'restaurants#index'
			# post '/suggestions', to: 'suggestions#create'
			# get '/me', to: 'users#me'
    	end
    end
end
