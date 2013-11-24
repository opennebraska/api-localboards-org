class AddInstallationDateToBoardMembers < ActiveRecord::Migration
  def change
    add_column :board_members, :installation_date, :datetime
  end
end
