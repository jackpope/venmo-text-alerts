Rails.application.routes.draw do

  authenticated :user do
    root :to => 'bills#index', as: :authenticated_root
  end

  devise_scope :user do
    root :to => 'devise/sessions#create'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  devise_for :users
  
  resources :bills, except: [:new, :edit]
  resources :copayers, only: [:create, :update, :destroy]

end
