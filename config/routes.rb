Rails.application.routes.draw do
  root 'words#index'

  resources :practices, only: :index
  resources :words do
    collection do
      get 'learn'
      get 'learn_articles'
      get 'history'
    end
    member do
      get 'verify'
    end
  end
end
