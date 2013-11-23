class Board < ActiveRecord::Base
  attr_accessible :title
  has_many :board_members
  has_many :departments
  has_many :members, through: :board_members
  has_many :board_seats
end
