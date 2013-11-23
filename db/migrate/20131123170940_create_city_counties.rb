class CreateCityCounties < ActiveRecord::Migration
  def change
    create_table :city_counties do |t|
      t.integer :city_id
      t.integer :county_id

      t.timestamps
    end
  end
end
