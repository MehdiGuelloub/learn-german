Rails.application.routes.draw do
  root 'words#learn', once_a_day: 'true'

  resources :practices, only: :index
  resources :words do
    collection do
      get :learn
      get :learn_articles
      get :learn_verb_prepositions
    end
    member do
      get :verify
    end
  end
end
