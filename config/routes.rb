Rails.application.routes.draw do
  get "/" => "sessions#new"
  post "/login" => "sessions#show"
  get "/login" => "sessions#new"
  post "/logout" => "sessions#destroy"
  post "/sessions/create" => "sessions#create"

  post "/lenders/create" => "lenders#create"
  post "/lenders/:id" => "lenders#show"
  get "/lenders/:id" => "lenders#show"

  post "/borrowers/create" => "borrowers#create"
  post "/borrowers/:id" => "borrowers#show"
  get "/borrowers/:id" => "borrowers#show"

  post "/loans/create/:id" => "loans#create"
end
