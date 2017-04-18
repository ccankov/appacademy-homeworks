Rails.application.routes.draw do
  resources :books, only: [:create, :new, :index, :destroy]
end
