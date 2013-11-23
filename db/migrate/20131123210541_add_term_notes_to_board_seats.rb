class AddTermNotesToBoardSeats < ActiveRecord::Migration
  def change
    add_column :board_seats, :term_notes, :string
  end
end
