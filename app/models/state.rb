class State < ActiveRecord::Base
  attr_accessible :name, :abbreviation

  has_many :counties
  
end
