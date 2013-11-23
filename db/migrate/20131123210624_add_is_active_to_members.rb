class AddIsActiveToMembers < ActiveRecord::Migration
  def change
    add_column :members, :is_active, :boolean
  end
end
