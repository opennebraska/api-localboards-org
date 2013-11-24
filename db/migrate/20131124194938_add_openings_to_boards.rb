class AddOpeningsToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :next_opening, :string
    add_column :boards, :next_opening_qual, :string
  end
end
