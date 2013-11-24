class AddMeetingCronToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :meeting_cron, :string
  end
end
