Rails.application.routes.draw do

  resources :follows, except: [:destroy]
  resources :users
  get "/users/:id/match", to: "users#match", as:"match"
  # resources :login
  get "/login", to: "login#new"
  post "/login", to: "login#create"
  delete "/login", to: "login#destroy"

  resources :conversations, path: "/inbox" do
    resources :messages
  end


  post "/follows/:id", to: "follows#chicken" 

  delete "follows/:id", to: "follows#delete"

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
