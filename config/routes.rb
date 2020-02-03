Rails.application.routes.draw do
  devise_for :users
  root to: 'books#top'
  get '/users' => 'users#users'
  get '/books' => 'users#books'

  resources :books, only: [:show, :edit]

  resources :users, only: [:show,:edit, :update] do
    resource :books, only: [:show, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
