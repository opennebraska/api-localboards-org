class BoardSeat < ActiveRecord::Base
  attr_accessible :alternate, :board_id, :qualifications, :term_length, :term_notes, :is_active
  has_one :board_member
  belongs_to :board
end
