class CityCounty < ActiveRecord::Base
  attr_accessible :city_id, :county_id, :is_active

  belongs_to :county
  belongs_to :city
end
