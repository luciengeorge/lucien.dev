Rails.application.routes.draw do
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
  resources :companies, except: :show
  resources :experiences
end
