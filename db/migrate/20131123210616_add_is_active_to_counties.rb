class AddIsActiveToCounties < ActiveRecord::Migration
  def change
    add_column :counties, :is_active, :boolean
  end
end
