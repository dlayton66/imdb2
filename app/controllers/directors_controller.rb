class DirectorsController < ApplicationController
  def new

  end
  
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
  end
end