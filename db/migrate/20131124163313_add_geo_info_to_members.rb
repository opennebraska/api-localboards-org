class AddGeoInfoToMembers < ActiveRecord::Migration
  def change
    add_column :members, :state_id, :integer
    add_column :members, :county_id, :integer
    add_column :members, :city_id, :integer
  end
end
