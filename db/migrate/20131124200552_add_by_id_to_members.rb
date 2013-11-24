class AddByIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :created_by_id, :integer
    add_column :members, :updated_by_id, :integer
  end
end
