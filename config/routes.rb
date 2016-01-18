Rails.application.routes.draw do

  root 'welcome#index'

  resources :slots
  resources :purchases


  #API
  mount API::APIRoot => '/v1'

end
