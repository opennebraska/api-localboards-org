class AddByIdToBoardSeats < ActiveRecord::Migration
  def change
    add_column :board_seats, :created_by_id, :integer
    add_column :board_seats, :updated_by_id, :integer
  end
end
