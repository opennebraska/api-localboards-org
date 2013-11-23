class AddCodeIdToCounties < ActiveRecord::Migration
  def change
    add_column :counties, :code_id, :integer
  end
end
