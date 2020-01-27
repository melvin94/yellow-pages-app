Rails.application.routes.draw do
  resources :service_types
  resources :service_organizations

  root 'service_types#index'

end
