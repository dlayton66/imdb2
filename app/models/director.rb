class Director < ApplicationRecord
  has_many :movies, dependent: :destroy

  def fullname
    [firstname,lastname].join(' ')
  end
end