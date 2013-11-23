class AddStateIdToCounties < ActiveRecord::Migration
  def change
    add_column :counties, :state_id, :integer
  end
end
