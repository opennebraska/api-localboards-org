class County < ActiveRecord::Base
  attr_accessible :name, :state_id

  has_many :city_counties
  has_many :cities, through: :city_counties
  belongs_to :state
  
end
