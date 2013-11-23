class AddCodeIdToStates < ActiveRecord::Migration
  def change
    add_column :states, :code_id, :integer
  end
end
