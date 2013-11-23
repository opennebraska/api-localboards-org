class Board < ActiveRecord::Base
  attr_accessible :title, :seats, :alternating_seats, :qualifications, :department_id, :term_length, :is_active, :state_id, :city_id, :county_id
  
  has_many :board_members
  has_many :departments
  has_many :members, through: :board_members
  has_many :board_seats
  
  belongs_to :state
  belongs_to :county
  belongs_to :city
end
