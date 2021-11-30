Rails.application.routes.draw do

  resources :topics
  root "books#list"

  get 'books/delete'
  get 'books/show_subjects'
  get 'books/get_from_request'

  resources :books
  resources :subjects

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
