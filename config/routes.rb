Rails.application.routes.draw do
  get "/journals" => "journals#index"
  get "/journals/:id" => "journals#show"
  post "/journals" => "journals#create"

  get "/journals/:id/journal-entries/:title" => "journal_entries#show"
  post "/journals/:id/journal-entries" => "journal_entries#create"

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"
end
