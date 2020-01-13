Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#new'
      get '/backgrounds', to: 'background#new'

      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'

      get '/antipode', to: 'antipode#new'
    end
  end
end
