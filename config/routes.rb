Rails.application.routes.draw do
  resources :comments
  resources :tags
  resources :likes
  resources :smoke_lists
  resources :entries
  resources :vendors
  resources :collections
  resources :users
  resources :strains
  post '/login', to: 'auth#create'
  get '/current_user', to: 'auth#show'
  get '/users_collection/:userId', to: 'collections#entireCollection'
  get '/users_vendors/:userId', to: 'vendors#allVendors'
  get '/users_entries/:userId', to: 'entries#allEntries'
  get '/all_comments/:type/:referenceId', to: 'comments#allComments'
  get '/users_smokeLists/:userId', to: 'users#allSmokeLists'
  post '/smoke_lists/new_entry', to: 'smoke_lists#newEntry'
  delete '/smoke_lists/delete/:sleId', to: 'smoke_lists#deleteEntry'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
