Rails.application.routes.draw do
  devise_for :companies, controllers: {
    sessions:      'companies/sessions',
    passwords:     'companies/passwords',
    registrations: 'companies/registrations'
  }
  devise_for :users, controllers: {
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
end
