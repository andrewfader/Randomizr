Randomizr::Application.routes.draw do
  devise_for :users
  root :to => 'home#show'
  resources :randomizers
end
