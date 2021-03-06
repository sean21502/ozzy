Rails.application.routes.draw do

	namespace :api, defaults: { format: :json } do

  match '/events', to: 'events#preflight', via: [:options]

  resources :events, only: [:create]

end

  resources :applications

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'welcome/index'

  get 'welcome/about'

  root to:'welcome#index'

end
