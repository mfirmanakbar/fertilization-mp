Rails.application.routes.draw do

  # login page
  root 'sessions#login'

  # dashboard
  get 'dashboard', to: 'dashboard#home'

  # materials
  resources :materials do
    collection {post :import}
  end
  get 'materials/import/csv' => 'materials#import_csv'
  get 'materials/download/template' => 'materials#download_template'

  # login and user
  get 'signup', to: 'users#signup'
  resources :users #, except: [:new]
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy'

  # roles
  resources :roles

  get 'forget', to: 'users#forget_password'
  post 'send_reset_password', to: 'users#send_reset_password'

end
