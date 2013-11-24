class State < ActiveRecord::Base
  attr_accessible :name, :abbreviation, :code_id, :is_active

  has_many :counties
  has_many :cities
  has_many :boards

  has_many :departments, through: :boards
end
