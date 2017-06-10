Rails.application.routes.draw do
  resources :articles
  resources :portal_sources

  root "portal_sources#index"

end
