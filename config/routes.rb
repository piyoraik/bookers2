Rails.application.routes.draw do
  devise_for :users
  root to: 'books#top'
  get '/home/about' => 'books#about', as: 'about'
  get '/users' => 'users#users', as: 'users'
  get '/books' => 'books#books', as: 'books'

  resources :books, only: [:show, :create, :update, :edit]

  resources :users, only: [:show,:edit, :update] do
    resource :books, only: [:show,:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end