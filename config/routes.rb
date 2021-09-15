Rails.application.routes.draw do

  # root 'api/v1/accounts#index'

  namespace :api do
    namespace :v1 do
      resources :api_keys, path: 'api-keys', only: %i[index create destroy] 
      
      resources :accounts, only: [:index, :show, :create, :update] do
        resources :invoices, only: [:index, :create, :update, :destroy] do
          resources :items, only: [:update, :destroy]
        end
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
