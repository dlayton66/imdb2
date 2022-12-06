class DirectorsController < ApplicationController
  def new

  end
  
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
  end

  def create
    Director.create!(director_params)
    redirect_to "/directors"
  end

  private

  def director_params
    params.permit(:firstname,:lastname,:age,:alive)
  end
end