Rails.application.routes.draw do
  devise_for :users
  root to: 'companies#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :companies do
    resources :customers do
      resources :quotes do
        resources :quote_services
        resources :services, only: [:new, :create]
        member do
          get :pdf
        end
      end
      resources :bills
    end
    resources :services
  end
end
