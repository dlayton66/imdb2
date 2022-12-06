Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/directors", to: "directors#index"
  get "/directors/new", to: "directors#new"
  get "/directors/:id", to: "directors#show"
  post "/directors", to: "directors#create"
  get "/directors/:id/edit", to: "directors#edit"
  patch "/directors/:id", to: "directors#update"

  get "/directors/:id/movies", to: "director_movies#index"
  get "/directors/:id/movies/new", to: "director_movies#new"
  post "/directors/:id/movies", to: "director_movies#create"

  get "/movies", to: "movies#index"
  get "/movies/:id", to: "movies#show"
  get "/movies/:id/edit", to: "movies#edit"
end
