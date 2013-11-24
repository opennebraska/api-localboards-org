class Member < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :is_active, :state_id, :county_id, :city_id
  has_many :board_members
  has_many :boards, through: :board_members
  belongs_to :state
  belongs_to :county
  belongs_to :city
end
