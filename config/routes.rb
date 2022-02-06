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
  delete 'composers/:id', to: 'composers#destroy'
end

# User Story 19, Parent Delete (x2)
#
# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent
