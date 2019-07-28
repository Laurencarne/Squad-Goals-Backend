Rails.application.routes.draw do

  resources :bill_splits, only: [:create, :update]
  resources :bills, only: [:create]
  resources :items, only: [:index, :show, :create, :update, :destroy]
  resources :events, only: [:index, :show, :create, :update, :destroy]
  resources :flats, only: [:create, :update, :destroy]
  resources :notes, only: [:show, :create, :destroy]
  resources :tasks

  namespace :api do
    namespace :v1 do
      resources :flatmates, only: [:create, :update]
    end
  end

  post "/auth/create", to: "auth#create"
  get "/auth/show", to: "auth#show"

  patch "/auth/move_in", to: "auth#move_in"

  get "/notes", to: "notes#my_notes"
  get "/flat", to: "flats#my_flat"

  get "/my_tasks", to: "tasks#my_tasks"

end
