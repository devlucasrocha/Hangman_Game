Rails.application.routes.draw do
  devise_for :admins
  resources :words
  get 'game/main_page'
  root to: 'game#main_page'
  get 'main', to: 'game#main_page'
end
