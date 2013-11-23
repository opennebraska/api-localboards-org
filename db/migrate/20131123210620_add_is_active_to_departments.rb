class AddIsActiveToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :is_active, :boolean
  end
end
