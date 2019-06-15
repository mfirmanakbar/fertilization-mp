Rails.application.routes.draw do

  # login page
  root 'sessions#new'

  # dashboard
  get 'dashboard', to: 'dashboard#home'

  # materials
  resources :materials do
    collection {post :import}
  end
  get 'materials/import/csv' => 'materials#import_csv'
  get 'materials/download/template' => 'materials#download_template'

  # login and user
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # roles
  resources :roles

end
