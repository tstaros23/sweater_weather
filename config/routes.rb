Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#index'
      get '/backgrounds', to: 'backgrounds#index'
      get '/activities', to: 'activities#index'
      post '/sessions', to: 'sessions#create'
      post '/users', to: 'users#create'
    end
  end
end
