class AddIsActiveToBoardMembers < ActiveRecord::Migration
  def change
    add_column :board_members, :is_active, :boolean
  end
end
