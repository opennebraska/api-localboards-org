class State < ActiveRecord::Base
  attr_accessible :name

  has_many :counties
end
