Rails.application.routes.draw do

  get 'sessions/new'
root 'pages#index'
  get 'pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users # resources :ソース名  resources メソッドを使うことで、HTTPメソッドとURLとアクションが紐づいたルート定義ができる（$rails routes)で確認
  resources :topics

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'

  resources :comments, :only => [:index, :new, :create, :destroy]

end
