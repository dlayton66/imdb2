class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @liked_movies = Movie.where(like: true)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)
    redirect_to "/movies/#{movie.id}"
  end

  private

  def movie_params
    params.permit(:title, :runtime, :release, :like, :dmst_gross, :intl_gross)
  end
end