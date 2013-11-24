class AddTitleToBoardSeats < ActiveRecord::Migration
  def change
    add_column :board_seats, :title, :string
  end
end
