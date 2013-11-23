class AddIsActiveToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :is_active, :boolean
  end
end
