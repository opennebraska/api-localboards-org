class MoveTermLengthColumn < ActiveRecord::Migration
  def up
    add_column :boards, :term_length, :integer
    remove_column :board_seats, :term_length
  end

  def down
    remove_column :boards, :term_length
    add_column :board_seats, :term_length, :integer
  end
end
