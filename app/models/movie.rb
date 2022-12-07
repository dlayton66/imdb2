class Movie < ApplicationRecord
  belongs_to :director

  def self.liked_movies
    Movie.where(like: true)
  end

  def self.liked_ordered_movies
    self.liked_movies.order(:title)
  end
end