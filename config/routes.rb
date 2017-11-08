Rails.application.routes.draw do

  resources :registered_applications

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'welcome/index'

  get 'welcome/about'

  root to:'welcome#index'

end
