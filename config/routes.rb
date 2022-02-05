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
  get '/pianos', to: 'pianos#index'
  get '/manufacturers', to: 'manufacturers#index'
end

# User Story 17, Parent Update From Parent Index Page (x2)
# As a visitor
# When I visit the parent index page
# Next to every parent, I see a link to edit that parent's info
# When I click the link
# I should be taken to that parents edit page where I can update its information just like in User Story 4
