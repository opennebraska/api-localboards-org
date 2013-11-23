class AddInfoColumnsToBoards < ActiveRecord::Migration
  def change
  	add_column :boards, :seats, :integer
  	add_column :boards, :alternating_seats, :integer
  	add_column :boards, :qualifications, :text
  	add_column :boards, :department_id, :integer
  	add_column :boards, :meeting_dates, :string
  	add_column :boards, :meeting_place, :string
  	add_column :boards, :meeting_time, :datetime
  	add_column :boards, :duties, :text
  	add_column :boards, :url, :string  	
  end
end
