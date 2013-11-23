class BoardMember < ActiveRecord::Base
  attr_accessible :board_id, :member_id, :board_seat_id, :is_active
  belongs_to :board
  belongs_to :member
  belongs_to :board_seat
end
