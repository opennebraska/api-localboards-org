class CreateBoardSeats < ActiveRecord::Migration
  def change
    create_table :board_seats do |t|
      t.integer :board_id
      t.boolean :alternate
      t.text :qualifications
      t.integer :term_length

      t.timestamps
    end
  end
end
