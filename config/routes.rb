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

  resources :examples, only: %i(index destroy) do
    collection do
      get :learn
    end
    member do
      post :verify_meaning
    end
  end

  get "api/terms"                             =>  "terms#index"

  post "api/verbs"                            =>  "verbs#create"
  get "api/verbs/:id"                         =>  "verbs#show"
  put "api/verbs/:id"                         =>  "verbs#update"
  delete "api/verbs/:id"                      =>  "verbs#destroy"

  post "api/adjectives"                       =>  "adjectives#create"
  get "api/adjectives/:id"                    =>  "adjectives#show"
  put "api/adjectives/:id"                    =>  "adjectives#update"
  delete "api/adjectives/:id"                 =>  "adjectives#destroy"

  post "api/nouns"                            =>  "nouns#create"
  get "api/nouns/:id"                         =>  "nouns#show"
  put "api/nouns/:id"                         =>  "nouns#update"
  delete "api/nouns/:id"                      =>  "nouns#destroy"

  get "api/examples/learn"                    =>  "examples#learn"
  post "api/examples/:id/verify_meaning"      =>  "examples#verify_meaning"  # params[:meaning]
end
