Rails.application.routes.draw do
  get '/pieces', to: 'pieces#index'
  get '/pieces/:id', to: 'pieces#show'

  get '/composers', to: 'composers#index'
  get '/composers/new', to: 'composers#new'
  get '/composers/:id', to: 'composers#show'
  get '/composers/:composer_id/index', to: 'compositions#index'
  post '/composers/:composer_id/index', to: 'compositions#index'
  get '/composers/:id/index/new', to: 'compositions#new'
  delete '/composers/:composerid/index/:id', to: 'compositions#destroy'
  post '/composers/:id/index/create', to: 'compositions#create'
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
  get '/pianos/:id/edit', to: 'pianos#edit'
  patch '/pianos/:id/edit', to: 'pianos#update'
  delete 'pianos/:id', to: 'pianos#destroy'

  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/new', to: 'manufacturers#new'
  post '/manufacturers', to: 'manufacturers#create'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:id', to: 'manufacturers#index'
  get '/manufacturers/:id/pianos', to: 'manufacturers#show'
  get '/manufacturers/:id/edit', to: 'manufacturers#edit'
  patch '/manufacturers/:id/edit', to: 'manufacturers#update'
  get '/manufacturers/:id/index', to: 'manufacturers#new'
  post '/manufacturers/:id/index/new', to: 'manufacturers#create'
  delete '/manufacturers/:id/delete', to: 'manufacturers#destroy'
  post '/manufacturers/:id/index', to: 'manufacturerspianos#index'

  get '/manufacturerspianos/:id/index', to: 'manufacturerspianos#index'
  get '/manufacturerspianos/:id/new', to: 'manufacturerspianos#new'
  post '/manufacturerspianos/:id/index', to: 'manufacturerspianos#create'
  post '/manufacturerspianos/:id/index/new', to: 'manufacturerspianos#create'

  # patch '/manufacturerspianos/:id', to: 'manufacturerspianos#update'








end

# As a visitor
# When I visit the Parent's children Index Page
# I see a form that allows me to input a number value
# When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
# Then I am brought back to the current index page with only the records that meet that threshold shown.
