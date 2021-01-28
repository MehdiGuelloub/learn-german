Rails.application.routes.draw do
  root 'words#learn'

  resources :practices, only: :index
  resources :words do
    collection do
      get :learn
      get :learn_articles
      get :learn_verb_prepositions
      get :history
    end
    member do
      get :verify
    end
  end
end
