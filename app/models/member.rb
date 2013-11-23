class Member < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :is_active
  has_many :board_members
  has_many :boards, through: :board_members
end
