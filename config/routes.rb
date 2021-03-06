Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :departments, only: [:new, :create, :show, :edit, :update] do
    resources :receipts, only: [:show, :edit, :update]
    patch '/receipt/:id', to: 'receipt#modify', as: :modify_receipt
  end

  resources :receipts, only: [:new, :create]

  resources :accounts, only: [:index]
  get 'accounts/paid', to: 'accounts#paid'

  mount Blazer::Engine, at: "blazer"
end
