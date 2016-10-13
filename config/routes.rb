Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root 'slots#show'

  resources :slots

  resources :purchases do
    collection do
      get 'success'
    end
  end

  get '/open/:row' => 'welcome#open'
  get '/rotate/:angle' => 'welcome#rotate'

  #API
  mount API::APIRoot => '/v1'

end
