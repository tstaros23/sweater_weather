Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#index'
      get '/backgrounds', to: 'backgrounds#index'
      post '/sessions', to: 'sessions#create'
      post '/users', to: 'users#create'
      post '/road_trip', to: 'roadtrips#create'
    end
  end
end
