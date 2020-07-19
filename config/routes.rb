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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
