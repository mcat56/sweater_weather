Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#new'
      get '/backgrounds', to: 'backgrounds#new'

      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'

      post 'road_trip', to: 'roadtrips#new'
    end
  end
end
