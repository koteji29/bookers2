Rails.application.routes.draw do
  devise_for :migrations
  get 'home/about', to: 'homes#about', as: 'about'
  # get 'users/show'
  # get 'users/edit'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  resources :users, only: [:show, :edit, :index, :update]
end
