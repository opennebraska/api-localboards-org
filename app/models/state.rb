class State < ActiveRecord::Base
  attr_accessible :name, :abbreviation, :code_id

  has_many :counties
  has_many :cities
  
end
