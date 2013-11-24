class Department < ActiveRecord::Base
  attr_accessible :name, :is_active
  has_many :boards
  has_many :cities, through: :boards
  has_many :counties, through: :boards
  has_many :states, through: :boards
end
