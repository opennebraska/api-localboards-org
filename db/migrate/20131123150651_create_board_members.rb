class CreateBoardMembers < ActiveRecord::Migration
  def change
    create_table :board_members do |t|
      t.integer :board_id
      t.integer :member_id

      t.timestamps
    end
  end
end
