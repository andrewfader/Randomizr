Randomizr::Application.routes.draw do
  devise_for :users
  root :to => 'home#show'
  resources :randomizers do
    resources :jumpers
    member do
      post :jumpers_sort
    end
  end
end
