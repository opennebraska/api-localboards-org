class AddIdFiledsToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :state_id, :integer
    add_column :boards, :county_id, :integer
    add_column :boards, :city_id, :integer
  end
end
