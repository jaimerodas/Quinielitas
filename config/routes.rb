# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'dashboards#show'

  resources :matches, except: %i[show]
  resources :bets, only: %i[index create update]
  resources :users, only: %i[index destroy] do
    resource :admin, only: %i[create destroy]
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'
  get 'sign_in', to: 'sessions#new'
end
