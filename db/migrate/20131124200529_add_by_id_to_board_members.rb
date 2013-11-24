class AddByIdToBoardMembers < ActiveRecord::Migration
  def change
    add_column :board_members, :created_by_id, :integer
    add_column :board_members, :updated_by_id, :integer
  end
end
