class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @liked_movies = Movie.liked_movies
    @liked_ordered_movies = Movie.liked_ordered_movies
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

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to "/movies"
  end

  private

  def movie_params
    params.permit(:title, :runtime, :release, :like, :dmst_gross, :intl_gross)
  end
end