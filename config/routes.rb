Rails.application.routes.draw do
  get "/journals" => "journals#index"
  post "/journals" => "journals#create"
end
