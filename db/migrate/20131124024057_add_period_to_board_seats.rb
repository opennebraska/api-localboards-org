class AddPeriodToBoardSeats < ActiveRecord::Migration
  def change
    add_column :board_seats, :period, :integer
  end
end
