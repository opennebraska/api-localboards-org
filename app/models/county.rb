class County < ActiveRecord::Base
  attr_accessible :name, :state_id, :code_id, :is_active

  has_many :city_counties
  has_many :cities, through: :city_counties
  has_many :boards
  has_many :departments, through: :boards
 
  belongs_to :state
end
