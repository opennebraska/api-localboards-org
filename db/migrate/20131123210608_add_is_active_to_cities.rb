class AddIsActiveToCities < ActiveRecord::Migration
  def change
    add_column :cities, :is_active, :boolean
  end
end
