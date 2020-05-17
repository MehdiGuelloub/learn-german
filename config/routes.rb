Rails.application.routes.draw do
  resources :words do
    collection do
      get 'learn'
    end
    member do
      get 'verify'
    end
  end
end
