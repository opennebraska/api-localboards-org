class RenameBoardTitleToTitle < ActiveRecord::Migration
  def change
  	rename_column :boards, :board_title, :title
  end
end
