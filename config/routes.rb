Rails.application.routes.draw do
 devise_for :users
 root to: 'homes#top'
 get 'home/about', to: 'homes#about'
 resources :users, only: [:index, :show, :edit, :update]
 resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
 
# post 'users/:id' => 'users#show'
# get 'users' => 'users#index'
# get 'books' => 'books#index'
# post 'books' => 'books#index'
# get 'edit' => 'books#edit'
end
