Rails.application.routes.draw do
	namespace :api do
    	namespace :v1 do
			# resources :users
			get '/restaurants/:search', to: 'restaurants#index'
			# post '/login', to: 'auth#create'
			# get '/me', to: 'users#me'
    	end
    end
end
