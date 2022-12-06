class DirectorMoviesController < ApplicationController
  def index
    @director = Director.find(params[:id])
    @movies = @director.movies
  end

  def new
    @director = Director.find(params[:id])
  end

  def create
    director = Director.find(params[:id])
    director.movies.create!(movie_params)
    redirect_to "/directors/#{director.id}/movies"
  end

  private
  def movie_params
    params.permit(:title, :runtime, :release, :like, :dmst_gross, :intl_gross)
  end
end
