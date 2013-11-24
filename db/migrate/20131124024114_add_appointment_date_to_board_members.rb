class AddAppointmentDateToBoardMembers < ActiveRecord::Migration
  def change
    add_column :board_members, :appointment_date, :datetime
  end
end
