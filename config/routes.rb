Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root :to => 'bills#index', as: :authenticated_root
  end

  devise_scope :user do
    root :to => 'devise/sessions#create'
  end

  resources :copayers, only: [:create, :update, :destroy]

end
