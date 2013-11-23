class BoardSeat < ActiveRecord::Base
  attr_accessible :alternate, :board_id, :qualifications, :term_length
  has_one :board_member
  belongs_to :board
end
