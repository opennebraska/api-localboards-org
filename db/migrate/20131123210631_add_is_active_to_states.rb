class AddIsActiveToStates < ActiveRecord::Migration
  def change
    add_column :states, :is_active, :boolean
  end
end
