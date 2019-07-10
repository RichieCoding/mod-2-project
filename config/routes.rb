Rails.application.routes.draw do

  resources :follows
  resources :users
  # resources :login
  get "/login", to: "login#new"
  post "/login", to: "login#create"
  delete "/login", to: "login#destroy"

  resources :conversations, path: "/inbox" do
    resources :messages
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
