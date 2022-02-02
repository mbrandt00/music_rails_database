Rails.application.routes.draw do
  get '/pieces', to: 'pieces#index'
  get '/composers', to: 'composers#index'
  get '/composers/:id', to: 'composers#info'
  get '/', to: 'welcome#index'
end
