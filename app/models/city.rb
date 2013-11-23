class City < ActiveRecord::Base
  attr_accessible :name
  has_many :city_counties
  has_many :counties, through: :city_counties
end
