Rails.application.routes.draw do

  root 'slots#show'

  resources :slots
  resources :purchases


  #API
  mount API::APIRoot => '/v1'

end
