Rails.application.routes.draw do
  devise_for :users, skip: :registrations
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  direct :cdn do |blob| # use cdn_url() helper
    File.join(Rails.application.credentials.aws[:cloudfront_url], blob.key)
  end

  namespace :admin do
    resources :commits
    resources :companies
    resources :contributors
    resources :educations
    resources :experiences
    resources :languages
    resources :repo_contributors
    resources :repo_languages
    resources :repos
    resources :schools
    resources :users
    resources :websites

    root to: "users#index"
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
