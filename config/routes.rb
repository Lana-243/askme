Rails.application.routes.draw do
  # post '/questions', to: 'questions#create'
  # patch '/questions/:id', to: 'questions#update'
  # delete '/questions/:id', to: 'questions#destroy'
  root to: 'questions#index'
  resources :questions
end
