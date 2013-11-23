class AddBoardSeatIdToBoardMember < ActiveRecord::Migration
  def change
    add_column :board_members, :board_seat_id, :integer
  end
end
