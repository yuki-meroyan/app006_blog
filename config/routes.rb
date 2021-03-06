Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'blogtexts#index';
  resources :blogtexts do
    resources :comments, only: [:new, :create]
  end
  resources :users, only: [:update, :edit, :index, :show] do
    resources :blogtexts, only: [:show, :destroy]
  end
    
end
