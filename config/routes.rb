Rails.application.routes.draw do
  root "surveys#index"

  resources :surveys do
    resources :questions
  end

  get '/questions/:id/edit_options', to: 'questions#edit_options', as: 'question_edit_options'
  patch '/questions/:id/update_options', to: 'questions#update_options', as: 'question_update_options'

end
