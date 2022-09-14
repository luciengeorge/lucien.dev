Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, skip: :registrations
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  direct :cdn do |blob| # use cdn_url() helper
    File.join(Rails.application.credentials.aws[:cloudfront_url], blob.key)
  end
  root to: 'pages#home'
  resources :repos, only: :index
  resources :companies, only: [ :new, :create ]
  resources :experiences, only: [ :index, :new, :create ] do
    get :resume, on: :collection, formats: :pdf
  end
  resources :educations, only: [ :new, :create ]
  resources :schools, only: :create
  resources :websites, only: [ :index, :new, :create ]
end
