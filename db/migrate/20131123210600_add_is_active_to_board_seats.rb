class AddIsActiveToBoardSeats < ActiveRecord::Migration
  def change
    add_column :board_seats, :is_active, :boolean
  end
end
