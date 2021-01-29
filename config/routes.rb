Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pages#index'
  get 'about' => 'pages#about'

  get ':slug' => 'home#show', as: 'home_category'

  resources :articles, only: :show
end
