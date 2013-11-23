class Department < ActiveRecord::Base
  attr_accessible :name, :is_active
  belongs_to :board
end
