Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    get "/dreams" => "dreams#index"
    post "/dreams" => "dreams#create"
    get "/dreams/:id" => "dreams#show"
    patch "/dreams/:id" => "dreams#update"

    get "/tags" => "tags#index"
    get "/tags/:id" => "tags#show"

    post "/sessions" => "sessions#create"
  end
end
