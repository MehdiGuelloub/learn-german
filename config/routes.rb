Rails.application.routes.draw do
  root 'terms#index'

  resources :practices, only: :index
  resources :words do
    collection do
      get :learn
      get :learn_articles
      get :history
    end
    member do
      get :verify
      get :migrate
    end
  end

  resources :terms, only: %i(index create)
  resources :verbs, only: %i(new create edit update destroy) do
    resources :examples, only: %i(new create)
    collection do
      get :learn_partizip
    end
    member do
      post :verify_partizip
    end
  end

  resources :nouns, only: %i(new create edit update destroy) do
    resources :examples, only: %i(new create)
  end

  resources :adjectives, only: %i(new create edit update destroy) do
    resources :examples, only: %i(new create)
  end

  resources :examples, only: :destroy do
    collection do
      get :learn
    end
    member do
      post :verify_meaning
    end
  end

end
