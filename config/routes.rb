# frozen_string_literal: true

Rails.application.routes.draw do
  resources :matches, except: %i[show]
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'
  get 'sign_in', to: 'sessions#new'
end
