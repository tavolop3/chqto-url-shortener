Rails.application.routes.draw do
  root to: 'home#index'
  resources :links
  get '/links/:id/stats', to: 'links#stats', as: :stats
  get '/links/:id/stats/list', to: 'links#list', as: :list_links
  get 'authenticated_endpoint/index'
  get 'home/index'
  get 'l/:slug', to: 'slug#show', as: :slug
  post '/l/:slug/authenticate', to: 'slug#authenticate', as: :authenticate_slug
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
end
