class BoardMember < ActiveRecord::Base
  attr_accessible :board_id, :member_id
  belongs_to :board
  belongs_to :member
end
