Rails.application.routes.draw do
  get 'scraper/vb'

  get 'scraper/knews'

  get 'scraper/kloop'

  resources :articles
  resources :portal_sources


  get 'kloop', to: 'articles#kloop'
  get "vb" , to: "articles#vb"
  get "knews", to: "articles#knews"

  root "portal_sources#index"

end
