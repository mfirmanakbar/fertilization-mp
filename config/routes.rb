Rails.application.routes.draw do

  root 'dashboard#home'
  get 'dashboard', to: 'dashboard#home'
  resources :materials do
    collection {post :import}
  end
  get 'materials/import/csv' => 'materials#import_csv'
  get 'materials/download/template' => 'materials#download_template'

end
