class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :key
      t.integer :user_id
      t.boolean :active

      t.timestamps
    end
  end
end
