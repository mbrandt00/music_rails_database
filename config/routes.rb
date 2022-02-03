Rails.application.routes.draw do
  get '/pieces', to: 'pieces#index'
  get '/pieces/:id', to: 'pieces#show'
  get '/composers', to: 'composers#index'
  get '/composers/new', to: 'composers#new'
  get '/composers/:id', to: 'composers#show'
  get '/composers/:composer_id/pieces', to: 'composers#compositions'
  post '/composers', to: 'composers#create'
  get '/', to: 'welcome#index'
end

# User Story 8, Child Index Link
#
# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index
