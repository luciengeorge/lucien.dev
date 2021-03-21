Rails.application.routes.draw do
  devise_for :users, skip: :registrations
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  root to: 'pages#home'
  resources :projects, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
