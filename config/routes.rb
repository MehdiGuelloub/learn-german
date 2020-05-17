Rails.application.routes.draw do
  root 'home#index'

  resources :words do
    collection do
      get 'learn'
    end
    member do
      get 'verify'
    end
  end
end
