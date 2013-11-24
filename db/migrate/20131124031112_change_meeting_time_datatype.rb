class ChangeMeetingTimeDatatype < ActiveRecord::Migration
  def up
    change_column :boards, :meeting_time, :string
  end

  def down
    change_column :boards, :meeting_time, :datetime
  end
end
