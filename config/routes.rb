Rails.application.routes.draw do
  resources :songs, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end
