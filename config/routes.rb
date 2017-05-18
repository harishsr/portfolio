Rails.application.routes.draw do
  devise_for :admins
  root 'entries#index'
  resources :entries
end
