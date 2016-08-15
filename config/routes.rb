Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root 'slots#show'

  resources :slots
  resources :purchases


  #API
  mount API::APIRoot => '/v1'

end
