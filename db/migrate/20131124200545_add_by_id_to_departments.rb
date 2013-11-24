class AddByIdToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :created_by_id, :integer
    add_column :departments, :updated_by_id, :integer
  end
end
