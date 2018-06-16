# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#index'
  resources :dashboard, only: [:index]
  resources :links
  resources :tags do
    get 'from_users', on: :collection
    get 'from_page', on: :collection
  end
end
