Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :flatmates, only: [:index, :create]
    end
  end

  post "/auth/create", to: "auth#create"
  get "/auth/show", to: "auth#show"

  get "/notes", to: "notes#my_notes"
  resources :notes, only: [:create, :destroy]
end
