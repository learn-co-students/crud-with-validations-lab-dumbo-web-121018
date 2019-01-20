Rails.application.routes.draw do

  resources :songs, only: %i[index new show create edit update]
  delete '/songs/:id', to: 'songs#delete'
end
