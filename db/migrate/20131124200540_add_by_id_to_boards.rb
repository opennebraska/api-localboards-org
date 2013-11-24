class AddByIdToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :created_by_id, :integer
    add_column :boards, :updated_by_id, :integer
  end
end
