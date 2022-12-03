class Director < ApplicationRecord
  has_many :movies

  def fullname
    [firstname,lastname].join(' ')
  end
end