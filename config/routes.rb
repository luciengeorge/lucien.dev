Rails.application.routes.draw do
  devise_for :users, skip: :registrations
  
  direct :cdn do |blob| # use cdn_url() helper
    File.join(Rails.application.credentials.aws[:cloudfront_url], blob.key)
  end
  
  root to: 'pages#home'
  resources :repos, only: :index
  resources :companies, only: [ :new, :create ]
  resources :experiences, only: [ :index, :new, :create ] do
    # get :resume, on: :collection, formats: :pdf
  end
  resources :educations, only: [ :new, :create ]
  resources :schools, only: :create
  resources :websites, only: [ :index, :new, :create ]
end
