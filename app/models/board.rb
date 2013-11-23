class Board < ActiveRecord::Base
  attr_accessible :title, :seats, :alternating_seats, :qualifications, :department_id, :term_length, :is_active
  has_many :board_members
  has_many :departments
  has_many :members, through: :board_members
  has_many :board_seats
end
