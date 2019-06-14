Rails.application.routes.draw do

  root 'dashboard#home'
  resources :materials # this one for POST GET to CRUD
  
end
