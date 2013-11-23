class AddIsActiveToCityCounties < ActiveRecord::Migration
  def change
    add_column :city_counties, :is_active, :boolean
  end
end
