class CityCounty < ActiveRecord::Base
  attr_accessible :city_id, :county_id

  belongs_to :county
  belongs_to :city
end
