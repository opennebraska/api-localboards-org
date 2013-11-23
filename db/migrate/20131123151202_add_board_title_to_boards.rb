class AddBoardTitleToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :board_title, :string
  end
end
