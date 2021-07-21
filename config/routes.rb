Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  resources :pitch_decks, only: %i[new create show]
end
