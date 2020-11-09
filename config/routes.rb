Rails.application.routes.draw do
  devise_for :companies, controllers: {
    sessions:      'companies/sessions',
    passwords:     'companies/passwords',
    registrations: 'companies/registrations'
  }
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  root to: 'top#index'
  resources :users, only: [:show] do
    resources :company_relations, only: [:create, :destroy]
  end
  resources :companies, only: [:show] do
    resources :user_relations, only: [:create, :destroy]
  end

  resources :rooms, only: [:show, :create, :destroy] do
    resources :messages, only: [:show, :create, :destroy]
    resources :company_messages, only: [:show, :create, :destroy]
  end
end
