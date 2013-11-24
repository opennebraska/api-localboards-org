class Department < ActiveRecord::Base
  attr_accessible :name, :is_active
  has_many :boards
end
