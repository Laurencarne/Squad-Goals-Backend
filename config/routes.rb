Rails.application.routes.draw do

  resources :items, only: [:index, :show, :create, :update, :destroy]
  resources :events, only: [:index, :show, :create, :update, :destroy]
  resources :flats, only: [:index, :show, :create, :update, :destroy]
  resources :notes, only: [:show, :create, :destroy]

  namespace :api do
    namespace :v1 do
      resources :flatmates, only: [:create, :update]
    end
  end

  post "/auth/create", to: "auth#create"
  get "/auth/show", to: "auth#show"

  patch "/auth/move_in/:id", to: "auth#move_in"

  get "/notes", to: "notes#my_notes"

end
