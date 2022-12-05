Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/directors", to: "directors#index"
  get "/directors/new", to: "directors#new"
  get "/directors/:id", to: "directors#show"
  get "/directors/:id/movies", to: "director_movies#index"

  get "/movies", to: "movies#index"
  get "/movies/:id", to: "movies#show"
end
