class City < ActiveRecord::Base
  attr_accessible :name, :state_id, :is_active
  has_many :city_counties
  has_many :counties, through: :city_counties
  has_many :boards
end
