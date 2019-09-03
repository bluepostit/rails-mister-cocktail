Rails.application.routes.draw do
  get 'cocktails/index'
  root to: 'cocktails#index'
  resources :cocktails, only: [:index, :show]
end
