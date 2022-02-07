Rails.application.routes.draw do
  get '/pieces', to: 'pieces#index'
  get '/pieces/:id', to: 'pieces#show'
  get '/composers', to: 'composers#index'
  get '/composers/new', to: 'composers#new'
  get '/composers/:id', to: 'composers#show'
  get '/composers/:composer_id/pieces', to: 'composers#compositions'
  get '/composers/:id/pieces/new', to: 'composers#create_composer_piece'
  post '/composers/:id/', to: 'pieces#create'
  post '/composers', to: 'composers#create'
  get '/composers/:id/edit', to: 'composers#edit'
  patch '/composers/:id/edit', to: 'composers#update'

  get '/', to: 'welcome#index'
  get '/pieces/:id/edit', to: 'pieces#edit'
  patch '/pieces/:id/edit', to: 'pieces#update'
  delete 'composers/:id', to: 'composers#destroy'
  delete 'pieces/:id', to: 'pieces#destroy'

  get '/pianos', to: 'pianos#index'
  get '/pianos/:id', to: 'pianos#show'

  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/:id', to: 'manufacturers#show'

end
