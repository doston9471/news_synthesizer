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

<<<<<<< HEAD

=======
>>>>>>> bed0c154146ce442385aef0e9b8138b9ab465953
end
